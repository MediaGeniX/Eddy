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

module TripsHelper
end
