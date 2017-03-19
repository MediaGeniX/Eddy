# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  default    :boolean          default(FALSE), not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
