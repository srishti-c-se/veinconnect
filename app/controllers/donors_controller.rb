class DonorsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @donors = Donor.all # modify
    @donors = Donor.active.all

    if params[:blood_type].present?
      @donors = @donors.where(blood_type: params[:blood_type])
    end

    # Filter by location if any selected
    if params[:location].present?
      @donors = @donors.where(address: params[:location])
    end
  end
end
