class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @current_meters = @user.trips.sum(:distance_in_meter)
    @days_cycled = @user.trips.count(:trip_date, distinct: true)
    @largest_distance_in_one_day = @user.trips.group(:trip_date).order('sum_distance_in_meter DESC').limit(1).sum(:distance_in_meter).values.first || 0
  end
end
