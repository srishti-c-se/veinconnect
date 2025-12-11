import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log('=== MAP CONTROLLER STARTING ===')
    console.log('Number of markers:', this.markersValue.length)

    // Log ALL markers data
    this.markersValue.forEach((marker, index) => {
      console.log(`Marker ${index}:`, marker)
    })

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
                 placeholder="Search facilities by name..."
                 class="search-input"
                 data-action="input->map#handleTyping">
          <div class="search-results"></div>
        </div>
      </div>
    `

    const searchContainer = document.createElement('div')
    searchContainer.innerHTML = searchHTML
    this.map.getContainer().appendChild(searchContainer.firstElementChild)

    this.searchInput = document.querySelector('.search-input')
    this.searchResults = document.querySelector('.search-results')
  }

  handleTyping() {
    const query = this.searchInput.value.trim()
    console.log('🔍 User typed:', query)

    if (this.searchTimer) {
      clearTimeout(this.searchTimer)
    }

    if (query.length === 0) {
      this.hideResults()
      this.showAllMarkers()
      return
    }

    this.searchTimer = setTimeout(() => {
      this.searchForFacilities(query)
    }, 250)
  }

  searchForFacilities(query) {
    const searchTerm = query.toLowerCase().trim()
    console.log('🔎 Searching for:', searchTerm)
    console.log('📊 Available markers:', this.markersValue)

    const matches = []

    this.markersValue.forEach((marker, index) => {
      console.log(`Checking marker ${index}:`, marker)

      // Check if marker has ANY text properties
      const markerText = JSON.stringify(marker).toLowerCase()
      if (markerText.includes(searchTerm)) {
        console.log(`✅ Match found in marker ${index}`)
        matches.push({
          index: index,
          // Try to get name from any property
          name: this.extractNameFromMarker(marker),
          lng: marker.lng,
          lat: marker.lat,
          address: marker.address || '',
          rawMarker: marker
        })
      }
    })

    console.log('🎯 Found matches:', matches)

    if (matches.length === 0) {
      this.showNoResults(query)
    } else {
      this.showMatches(matches, query)
    }

    this.filterMapMarkers(searchTerm)
  }

  extractNameFromMarker(marker) {
    // Try different possible property names
    if (marker.name) return marker.name
    if (marker.title) return marker.title
    if (marker.facility_name) return marker.facility_name
    if (marker.info_window_html) {
      // Try to extract name from HTML
      const tempDiv = document.createElement('div')
      tempDiv.innerHTML = marker.info_window_html
      const h3 = tempDiv.querySelector('h3')
      if (h3) return h3.textContent
    }
    return 'Unnamed Facility'
  }

  showMatches(matches, query) {
    let html = '<div class="matches-list">'

    matches.slice(0, 8).forEach((match, i) => {
      html += `
        <div class="match-item"
             data-index="${match.index}"
             data-action="click->map#selectMatch">
          <div class="match-name">${match.name}</div>
          ${match.address ? `<div class="match-address">${match.address}</div>` : ''}
        </div>
      `
    })

    html += '</div>'
    this.searchResults.innerHTML = html
    this.searchResults.classList.add('visible')
  }

  showNoResults(query) {
    this.searchResults.innerHTML = `
      <div class="no-matches">
        No facilities found for "${query}"
        <br><small>Check console for debug info</small>
      </div>
    `
    this.searchResults.classList.add('visible')
  }

  selectMatch(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    console.log('Selected match index:', index, 'Marker:', this.markersValue[index])

    if (this.markersValue[index]) {
      const marker = this.markersValue[index]

      // Update search input with the extracted name
      this.searchInput.value = this.extractNameFromMarker(marker)

      // Zoom to location
      this.map.flyTo({
        center: [marker.lng, marker.lat],
        zoom: 14,
        duration: 1000
      })

      // Open popup
      if (this.allMarkers[index]) {
        setTimeout(() => {
          this.allMarkers[index].togglePopup()
        }, 500)
      }

      this.hideResults()
    }
  }

  filterMapMarkers(searchTerm) {
    // Hide all markers first
    this.allMarkers.forEach(marker => {
      if (marker.getElement()) {
        marker.getElement().style.display = 'none'
      }
    })

    // Show matching markers
    this.markersValue.forEach((marker, index) => {
      const markerText = JSON.stringify(marker).toLowerCase()
      if (markerText.includes(searchTerm)) {
        if (this.allMarkers[index] && this.allMarkers[index].getElement()) {
          this.allMarkers[index].getElement().style.display = 'block'
        }
      }
    })
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
