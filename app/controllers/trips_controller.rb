# == Schema Information
#
# Table name: trips
#
#  id                :integer          not null, primary key
#  trip_date         :datetime         not null
#  distance_in_meter :integer          not null
#  from              :string           not null
#  to                :string           not null
#  route_id          :integer
#  user_id           :integer          not null
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

  private

  def trip_params
    params.require(:trip).permit(:trip_date, :from, :to, :distance_in_kilometer, :route)
  end
end
