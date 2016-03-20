class ScoreboardController < ApplicationController
  def index
    @yellow_jersey = Trip.group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
    @polka_dot_jersey = Trip.group(:user).order('count_id DESC').count(:id)

    @green_jersey = User.find_by_sql(
      'SELECT MAX(total_distance) AS maximum_total_distance, name, id AS id
       FROM (SELECT users.name, users.id, SUM(distance_in_meter) AS total_distance
          FROM users
          INNER JOIN trips ON trips.user_id = users.id
          GROUP BY trip_date, user_id)
       GROUP BY id
       ORDER BY maximum_total_distance DESC')

    @pink_jersey = Trip.joins(:user).merge(User.women).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
    @white_jersey = Trip.joins(:user).merge(User.young).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
    @grey_jersey = Trip.joins(:user).merge(User.old).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end
end