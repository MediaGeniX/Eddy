# == Schema Information
#
# Table name: trips
#
#  id                :integer          not null, primary key
#  trip_date         :date             not null
#  route_id          :integer
#  user_id           :integer          not null
#  alias             :string           not null
#  distance_in_meter :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

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

  def copy_to_next_working_day
    @copied_trip = @trip.copy_to_next_working_day
  end

  def copy_to_today
    @copied_trip = @trip.copy_to_today
  end

  def copy_to_same_day
    @copied_trip = @trip.copy_to_same_day
  end

  private

  def trip_params
    params.require(:trip).permit(:trip_date, :alias, :distance_in_kilometer)
  end
end
