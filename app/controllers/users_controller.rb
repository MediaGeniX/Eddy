# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  birthdate              :date             not null
#  location               :integer          default(0), not null
#  sex                    :integer          default(0), not null
#  admin                  :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_action :get_user

  def show
    @current_meters = @user.trips.sum(:distance_in_meter)
    @days_cycled = @user.trips.count('DISTINCT trip_date')
    @largest_distance_in_one_day = @user.trips.group(:trip_date).order('sum_distance_in_meter DESC').limit(1).sum(:distance_in_meter).values.first || 0
  end

  private

  def get_user
    @user = User.find(params[:id])
    authorize @user
  end

end
