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

  before_filter :authenticate_user!

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
    params.require(:route).permit(:alias, :distance_in_kilometer)
  end
end
