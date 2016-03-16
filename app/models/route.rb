# == Schema Information
#
# Table name: routes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  from       :string           not null
#  to         :string           not null
#  distance   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Route < ActiveRecord::Base
  belongs_to :user
  belongs_to :from, class_name: "Location"
  belongs_to :to, class_name: "Location"

  validates :from, presence: true
  validates :to, presence: true
  validates :distance, presence: true
end
