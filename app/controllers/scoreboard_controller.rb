class ScoreboardController < ApplicationController

  def index
    @seasons = Season.all
    @selected_season = Season.find_by_id(params[:season]) || Season.default
    @selected_season = nil

    @current_meters = Trip.sum(:distance_in_meter)

    @yellow_jersey = Trip.group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
    @polka_dot_jersey = Trip.joins(:user).select('DISTINCT trip_date').order('count_distinct_trip_date DESC').group(:user).count

    @green_jersey = User.find_by_sql(
      'SELECT MAX(total_distance) AS maximum_total_distance, name, id AS id
       FROM (SELECT users.name, users.id, SUM(distance_in_meter) AS total_distance
          FROM users
          INNER JOIN trips ON trips.user_id = users.id
          GROUP BY trip_date, users.name, users.id) AS useless_alias_for_postgres
       GROUP BY name, id
       ORDER BY maximum_total_distance DESC')

    @pink_jersey = Trip.joins(:user).merge(User.women).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
    @white_jersey = Trip.joins(:user).merge(User.young).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
    @grey_jersey = Trip.joins(:user).merge(User.old).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end
end
