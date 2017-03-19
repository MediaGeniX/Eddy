module FilteringForScoreboard
  extend ActiveSupport::Concern

  included do
    attr_reader :selected_season, :start_date, :end_date, :distance
    before_filter :set_season
    before_filter :set_dates
  end

  def set_season
    @selected_season = Season.find_by_id([params[:season]]) || Season.default
  end

  def set_dates
    @start_date = @selected_season.start_date if @selected_season
    @end_date = @selected_season.end_date if @selected_season
  end
end
