# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  distance   :integer
#  trip_date  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :reference
#

class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :from, class_name: "Location"
  belongs_to :to, class_name: "Location"

  validates :from, presence: true
  validates :to, presence: true
  validates :distance, presence: true
end
