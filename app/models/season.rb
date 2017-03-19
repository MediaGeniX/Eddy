# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  default    :boolean          default(FALSE), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Season < ActiveRecord::Base
  validates_uniqueness_of :default, if: :default


  def self.default
    self.where(default: true).first
  end

  def display_name
    "#{name} (#{start_date} - #{end_date})"
  end
end
