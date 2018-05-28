# == Schema Information
#
# Table name: seasons
#
#  id                :integer          not null, primary key
#  start_date        :date
#  end_date          :date
#  default           :boolean          default(FALSE), not null
#  name              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  distance_in_meter :integer          default(25000000)
#

require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
