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

  before_action :authenticate_user!

  before_action :get_user, only: [:create, :index, :create_from_route]
  before_action :get_trip, except: [:index, :create, :create_from_route]

  def index
    @trips = @user.trips.sorted_by_date
  end

  def create
    @trip = @user.trips.create(trip_params)
    authorize @trip
  end

  def create_from_route
    route = @user.routes.find route_params[:route]
    date = route_params[:trip_date]
    authorize route, :show?
    @new_trip = Trip.create_from_route(@user, date, route)
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
    authorize @copied_trip
  end

  def copy_to_today
    @copied_trip = @trip.copy_to_today
    authorize @copied_trip
  end

  def copy_to_same_day
    @copied_trip = @trip.copy_to_same_day
    authorize @copied_trip
  end

  private

  def get_user
    @user = User.find(params[:user_id])
    authorize @user, :edit?
  end

  def get_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:trip_date, :alias, :distance_in_kilometer)
  end

  def route_params
    params.require(:trip).permit(:trip_date, :route)
  end
end
