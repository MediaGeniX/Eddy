# == Schema Information
#
# Table name: routes
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  alias             :string           not null
#  distance_in_meter :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


class RoutesController < ApplicationController

  before_action :authenticate_user!

  before_action :get_user, only: [:create, :index]
  before_action :get_route, only: [:show, :update, :destroy, :edit]

  def index
    @routes = policy_scope(@user.routes)
  end

  def create
    @route = @user.routes.create(route_params)
    authorize @route
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
    params.require(:route).permit(:alias, :distance_in_kilometer)
  end

  def get_route
    @route = Route.find(params[:id])
    authorize @route
  end

  def get_user
    @user = User.find(params[:user_id])
    authorize @user, :edit?
  end


end
