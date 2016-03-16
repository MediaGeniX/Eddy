# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  trip_date  :datetime         not null
#  distance   :integer          not null
#  from       :string           not null
#  to         :string           not null
#  route_id   :integer
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :from, class_name: "Location"
  belongs_to :to, class_name: "Location"

  validates :from, presence: true
  validates :to, presence: true
  validates :distance, presence: true
end
