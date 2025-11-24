class DonorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @donors = DonorProfile.all
  end

  def edit
    
  end

  def new
  end

  def create
  end

  def update
  end
end
