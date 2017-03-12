class WelcomeController < ApplicationController
  def index
    @yellow_jersey = Trip.group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end
end
