# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Season < ActiveRecord::Base
end
