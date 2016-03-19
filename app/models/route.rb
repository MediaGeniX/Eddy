# == Schema Information
#
# Table name: routes
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  from              :string           not null
#  to                :string           not null
#  alias             :string
#  distance_in_meter :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Route < ActiveRecord::Base
  belongs_to :user
  has_many :trips

  validates :from, presence: true
  validates :to, presence: true
  validates :distance_in_meter, presence: true

  attr_accessor :distance_in_kilometer

  def distance_in_kilometer
    (read_attribute(:distance_in_meter) || 0) / 1000.0
  end

  def distance_in_kilometer=(value)
    if value.is_a? String then value.sub!(',', '.') end
    write_attribute(:distance_in_meter, (value.to_f * 1000).to_int)
  end
end
