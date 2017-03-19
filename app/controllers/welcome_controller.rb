class WelcomeController < ApplicationController
  def index
    season = Season.default
    start_date = season ? season.start_date : Date.new(1900)
    end_date = season ? season.end_date : Date.new(2200)
    @yellow_jersey = Trip.where(trip_date: start_date..end_date).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end
end
