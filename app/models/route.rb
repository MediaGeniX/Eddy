class Route < ActiveRecord::Base
  belongs_to :user
  belongs_to :from, class_name: "Location"
  belongs_to :to, class_name: "Location"

  validates :from, presence: true
  validates :to, presence: true
  validates :distance, presence: true
end
