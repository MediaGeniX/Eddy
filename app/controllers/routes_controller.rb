class RoutesController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :route, through: :user

  def index
  end

  def create
    @route.save
  end

  def edit
  end

  def update
    @route.update route_params
  end

  def destroy
    @route.destroy
  end

  private

  def route_params
    params.require(:route).permit(:from_id, :to_id, :distance)
  end
end
