# == Schema Information
#
# Table name: routes
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  alias             :string           not null
#  distance_in_meter :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


class Route < Movement
  def display_name
    "#{self.alias} (#{self.distance_in_meter / 1000.0} km)"
  end
end
