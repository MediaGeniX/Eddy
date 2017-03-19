module FilteringForUserProgress
  extend ActiveSupport::Concern

  included do
    before_filter :set_user
    before_filter :set_season
    before_filter :set_dates
    before_filter :set_current_meters
    before_filter :set_days_cycled
    before_filter :set_largest_distance_in_one_day
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def set_season
    @selected_season = (params[:season] && Season.find_by_name(params[:season])) \
      || Season.find_by_id([params[:season]]) \
      || Season.default
  end

  def set_dates
    @start_date = (@selected_season.start_date if @selected_season) || Date.new(1900)
    @end_date = (@selected_season.end_date if @selected_season) || Date.new(2200)
  end

  def set_current_meters
    @current_meters = trips.sum(:distance_in_meter)
  end

  def set_days_cycled
    @days_cycled = trips.count('DISTINCT trip_date')
  end

  def set_largest_distance_in_one_day
    @largest_distance_in_one_day = trips.group(:trip_date).order('sum_distance_in_meter DESC').limit(1).sum(:distance_in_meter).values.first || 0
  end

  private

    def trips
      @user.trips.where(trip_date: @start_date..@end_date)
    end
end
