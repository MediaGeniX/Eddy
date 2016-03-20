class Movement < ActiveRecord::Base
  self.abstract_class = true

  belongs_to :user

  validates :alias, presence: true
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
