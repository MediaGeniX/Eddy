module FilteringForScoreboard
  extend ActiveSupport::Concern

  included do
    before_filter :set_season
    before_filter :set_dates
    before_filter :set_current_meters
    before_filter :set_jerseys
  end

  def set_season
    @selected_season = Season.find_by_id([params[:season]]) || Season.default
  end

  def set_dates
    @start_date = @selected_season.start_date if @selected_season
    @end_date = @selected_season.end_date if @selected_season
  end

  def set_current_meters
    @current_meters = trips.sum(:distance_in_meter)
  end

  def set_jerseys
    set_yellow_jersey
    set_polka_dot_jersey
    set_green_jersey
    set_pink_jersey
    set_white_jersey
    set_grey_jersey
  end

  def set_yellow_jersey
    @yellow_jersey = trips.group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end

  def set_polka_dot_jersey
    @polka_dot_jersey = trips.joins(:user).select('DISTINCT trip_date').order('count_distinct_trip_date DESC').group(:user).count
  end

  def set_green_jersey
    @green_jersey = User.find_by_sql([
      'SELECT MAX(total_distance) AS maximum_total_distance, name, id AS id
       FROM (SELECT users.name, users.id, SUM(distance_in_meter) AS total_distance
          FROM users
          INNER JOIN trips ON trips.user_id = users.id
          GROUP BY trip_date, users.name, users.id
          HAVING trips.trip_date BETWEEN ? AND ?) AS useless_alias_for_postgres
       GROUP BY name, id
       ORDER BY maximum_total_distance DESC', @start_date, @end_date])
  end

  def set_pink_jersey
    @pink_jersey = trips.joins(:user).merge(User.women).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end

  def set_white_jersey
    @white_jersey = trips.joins(:user).merge(User.young).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end

  def set_grey_jersey
    @grey_jersey = trips.joins(:user).merge(User.old).group(:user).order('sum_distance_in_meter DESC').sum(:distance_in_meter)
  end

  private
  def trips
    Trip.where(trip_date: @start_date..@end_date)
  end
end
