class LocationsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :location, through: :user

  def index
  end

  def create
    @location.save
  end

  def edit
  end

  def update
    @location.update location_params
  end

  def destroy
    @location.destroy
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
