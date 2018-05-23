class Hr::ReportsController < ApplicationController

  def new
    authorize [:hr, :report]
  end

  def create
    authorize [:hr, :report]

    params = report_params

    start_date = params[:start_date] || Date.new(1900)
    end_date = params[:end_date] || Date.new(2100)

    respond_to do |format|
      format.csv { send_data Trip.to_csv(start_date, end_date), filename: "trips-#{start_date}-#{end_date}.csv" }
    end
  end

  private

  def report_params
    params.permit(:start_date, :end_date)
  end

end