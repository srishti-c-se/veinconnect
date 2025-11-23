class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @facilities = Facility.all

    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "facilities/info_window", locals: { facility: facility }),
        marker_html: render_to_string(partial: "facilities/marker", locals: { facility: facility })
      }
    end
  end
end
