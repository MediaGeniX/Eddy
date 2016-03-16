class TripsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :trip, through: :user

  def index
  end

  def create
    @trip.save
  end

  def edit
  end

  def update
    @trip.update trip_params
  end

  def destroy
    @trip.destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:trip_date, :from_id, :to_id, :distance)
  end
end
