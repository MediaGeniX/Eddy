class Hr::TripsController < ApplicationController

  def report
    authorize [:hr, :trip]

    start_date = params[:start_date] || Date.new(1900)
    end_date = params[:end_date] || Date.new(2100)

    respond_to do |format|
      format.csv { send_data Trip.to_csv(start_date, end_date), filename: "trips-#{start_date}-#{end_date}.csv" }
    end
  end

end