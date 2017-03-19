class WelcomeController < ApplicationController
  def index
    season = Season.default
    @yellow_jersey = Trip.where(trip_date: season.start_date..season.end_date).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end
end
