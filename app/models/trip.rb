# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  distance   :integer
#  trip_date  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip < ActiveRecord::Base
end
