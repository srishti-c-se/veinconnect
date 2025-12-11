import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [57.5522, -20.3484],
      zoom: 9
    })

    this.allMarkers = []
    this.searchTimer = null

    this.createSearchBox()

    this.map.on('load', () => {
      this.addAllMarkers()
      if (this.markersValue.length > 0) {
        this.fitToMarkers()
      }
    })
  }

  createSearchBox() {
    const searchHTML = `
      <div class="search-box-container">
        <div class="search-box">
          <input type="text"
                 placeholder="Search facilities or towns..."
                 class="search-input"
                 data-action="input->map#handleTyping keydown.enter->map#handleEnter">
          <button class="search-clear" data-action="click->map#clearSearch">
            ×
          </button>
          <button class="search-button" data-action="click->map#handleSearchButton">
            🔍
          </button>
          <div class="search-results"></div>
        </div>
      </div>
    `

    const searchContainer = document.createElement('div')
    searchContainer.innerHTML = searchHTML
    this.map.getContainer().appendChild(searchContainer.firstElementChild)

    this.searchInput = document.querySelector('.search-input')
    this.searchResults = document.querySelector('.search-results')
    this.clearButton = document.querySelector('.search-clear')
    this.searchButton = document.querySelector('.search-button')
  }

  handleTyping() {
    const query = this.searchInput.value.trim()

    if (this.searchTimer) {
      clearTimeout(this.searchTimer)
    }

    if (query.length === 0) {
      this.hideResults()
      this.showAllMarkers()
      return
    }

    this.searchTimer = setTimeout(() => {
      this.searchAll(query)
    }, 250)
  }

  // ADD THIS METHOD: Handle search button click
  handleSearchButton() {
    const query = this.searchInput.value.trim()
    if (query.length > 0) {
      this.searchAll(query)
    }
  }

  // ADD THIS METHOD: Clear search
  clearSearch() {
    this.searchInput.value = ''
    this.hideResults()
    this.showAllMarkers()
  }

  // Rest of your existing methods remain the same...
  // (handleEnter, searchAll, searchFacilities, searchTowns, etc.)

  handleEnter(event) {
    if (event.key === 'Enter') {
      const query = this.searchInput.value.trim()
      if (query.length > 0) {
        this.searchTownLocation(query)
      }
    }
  }

  async searchAll(query) {
    const searchTerm = query.toLowerCase().trim()

    const facilityMatches = this.searchFacilities(searchTerm)

    if (facilityMatches.length === 0) {
      const townMatches = await this.searchTowns(searchTerm)
      this.displayCombinedResults([], townMatches, query)
    } else {
      this.displayCombinedResults(facilityMatches, [], query)
    }
  }

  searchFacilities(searchTerm) {
    const matches = []

    this.markersValue.forEach((marker, index) => {
      const markerText = JSON.stringify(marker).toLowerCase()
      if (markerText.includes(searchTerm)) {
        matches.push({
          type: 'facility',
          index: index,
          name: this.extractNameFromMarker(marker),
          lng: marker.lng,
          lat: marker.lat,
          address: marker.address || ''
        })
      }
    })

    return matches
  }

  async searchTowns(searchTerm) {
    try {
      const response = await fetch(
        `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(searchTerm)}.json?` +
        `access_token=${this.apiKeyValue}&` +
        `bbox=57.2,-20.6,57.9,-19.9&` +
        `types=place,locality,neighborhood&` +
        `limit=5`
      )

      const data = await response.json()

      if (data.features && data.features.length > 0) {
        return data.features.map(feature => ({
          type: 'town',
          name: feature.place_name,
          lng: feature.center[0],
          lat: feature.center[1],
          relevance: feature.relevance
        }))
      }
    } catch (error) {
      console.error('Town search error:', error)
    }

    return []
  }

  displayCombinedResults(facilityMatches, townMatches, query) {
    if (facilityMatches.length === 0 && townMatches.length === 0) {
      this.showNoResults(query)
      return
    }

    let html = '<div class="matches-list">'

    if (facilityMatches.length > 0) {
      html += '<div class="result-section">'
      html += '<div class="section-title">Facilities</div>'

      facilityMatches.slice(0, 5).forEach((match, i) => {
        html += `
          <div class="match-item facility-match"
               data-type="facility"
               data-index="${match.index}"
               data-action="click->map#selectResult">
            <div class="match-name">${match.name}</div>
            ${match.address ? `<div class="match-address">${match.address}</div>` : ''}
          </div>
        `
      })

      html += '</div>'
    }

    if (townMatches.length > 0) {
      html += '<div class="result-section">'
      html += '<div class="section-title">Towns & Locations</div>'

      townMatches.slice(0, 5).forEach((town, i) => {
        html += `
          <div class="match-item town-match"
               data-type="town"
               data-lng="${town.lng}"
               data-lat="${town.lat}"
               data-name="${town.name}"
               data-action="click->map#selectResult">
            <div class="match-name">${town.name}</div>
            <div class="match-type">📍 Town/Location</div>
          </div>
        `
      })

      html += '</div>'
    }

    html += `
      <div class="match-item location-search"
           data-type="location"
           data-query="${query}"
           data-action="click->map#searchExactLocation">
        <div class="match-name">Search for "${query}" as exact location</div>
        <div class="match-type">🔍 Search on map</div>
      </div>
    `

    html += '</div>'
    this.searchResults.innerHTML = html
    this.searchResults.classList.add('visible')

    this.filterMapMarkersForSearch(query)
  }

  selectResult(event) {
    const type = event.currentTarget.dataset.type

    if (type === 'facility') {
      this.selectFacility(event)
    } else if (type === 'town') {
      this.selectTown(event)
    }
  }

  selectFacility(event) {
    const index = parseInt(event.currentTarget.dataset.index)

    if (this.markersValue[index]) {
      const marker = this.markersValue[index]

      this.searchInput.value = this.extractNameFromMarker(marker)

      this.map.flyTo({
        center: [marker.lng, marker.lat],
        zoom: 14,
        duration: 1000
      })

      if (this.allMarkers[index]) {
        setTimeout(() => {
          this.allMarkers[index].togglePopup()
        }, 500)
      }

      this.hideResults()
    }
  }

  selectTown(event) {
    const lng = parseFloat(event.currentTarget.dataset.lng)
    const lat = parseFloat(event.currentTarget.dataset.lat)
    const name = event.currentTarget.dataset.name

    this.searchInput.value = name

    this.map.flyTo({
      center: [lng, lat],
      zoom: 12,
      duration: 1000
    })

    this.hideResults()
  }

  async searchExactLocation(event) {
    const query = event.currentTarget.dataset.query
    await this.searchTownLocation(query, true)
  }

  async searchTownLocation(query, exact = false) {
    try {
      const response = await fetch(
        `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(query)}.json?` +
        `access_token=${this.apiKeyValue}&` +
        `bbox=57.2,-20.6,57.9,-19.9&` +
        `limit=1`
      )

      const data = await response.json()

      if (data.features && data.features.length > 0) {
        const [lng, lat] = data.features[0].center

        if (exact) {
          this.searchInput.value = data.features[0].place_name
        }

        this.map.flyTo({
          center: [lng, lat],
          zoom: exact ? 14 : 12,
          duration: 1000
        })

        this.hideResults()
      } else {
        this.showNoResults(query)
      }
    } catch (error) {
      console.error('Location search error:', error)
    }
  }

  showNoResults(query) {
    this.searchResults.innerHTML = `
      <div class="no-matches">
        No results found for "${query}"
        <br><small>Try a different search term</small>
      </div>
    `
    this.searchResults.classList.add('visible')

    this.allMarkers.forEach(marker => {
      if (marker.getElement()) {
        marker.getElement().style.display = 'none'
      }
    })
  }

  filterMapMarkersForSearch(searchTerm) {
    this.allMarkers.forEach(marker => {
      if (marker.getElement()) {
        marker.getElement().style.display = 'none'
      }
    })

    this.markersValue.forEach((marker, index) => {
      const markerText = JSON.stringify(marker).toLowerCase()
      if (markerText.includes(searchTerm.toLowerCase())) {
        if (this.allMarkers[index] && this.allMarkers[index].getElement()) {
          this.allMarkers[index].getElement().style.display = 'block'
        }
      }
    })
  }

  extractNameFromMarker(marker) {
    if (marker.name) return marker.name
    if (marker.title) return marker.title
    if (marker.facility_name) return marker.facility_name
    if (marker.info_window_html) {
      const tempDiv = document.createElement('div')
      tempDiv.innerHTML = marker.info_window_html
      const h3 = tempDiv.querySelector('h3')
      if (h3) return h3.textContent
    }
    return 'Unnamed Facility'
  }

  showAllMarkers() {
    this.allMarkers.forEach(marker => {
      if (marker.getElement()) {
        marker.getElement().style.display = 'block'
      }
    })
  }

  hideResults() {
    this.searchResults.innerHTML = ''
    this.searchResults.classList.remove('visible')
  }

  addAllMarkers() {
    this.markersValue.forEach((marker, index) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const newMarker = new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)

      this.allMarkers.push(newMarker)
    })
  }

  fitToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([57.5522, -20.3484])
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, {
      padding: 70,
      maxZoom: 15,
      duration: 1000
    })
  }
}
