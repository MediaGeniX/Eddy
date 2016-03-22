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

class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @current_meters = @user.trips.sum(:distance_in_meter)
    @days_cycled = @user.trips.count(:trip_date, distinct: true)
    @largest_distance_in_one_day = @user.trips.group(:trip_date).order('sum_distance_in_meter DESC').limit(1).sum(:distance_in_meter).values.first || 0
  end
end
