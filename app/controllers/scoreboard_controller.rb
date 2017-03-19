class ScoreboardController < ApplicationController
  include FilteringForScoreboard

  def index
    @seasons = Season.all
  end
end
