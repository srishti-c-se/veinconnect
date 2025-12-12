class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all

    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        name: facility.name,
        address: facility.address,
        info_window_html: render_to_string(partial: "info_window", locals: { facility: facility }),
        marker_html: render_to_string(partial: "marker", locals: { facility: facility })
      }
    end
  end
end
