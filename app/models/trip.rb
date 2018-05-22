# == Schema Information
#
# Table name: trips
#
#  id                :integer          not null, primary key
#  trip_date         :date             not null
#  route_id          :integer
#  user_id           :integer          not null
#  alias             :string           not null
#  distance_in_meter :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


class Trip < Movement
  belongs_to :user

  validates :trip_date, presence: true

  scope :sorted_by_date, -> { order(trip_date: :desc) }

  def copy_to_next_working_day
    copy_to_date(next_working_day(self.trip_date))
  end

  def copy_to_today
    copy_to_date(Date.today)
  end

  def copy_to_same_day
    copy_to_date(self.trip_date)
  end

  def self.create_from_route(user, date, route)
    user.trips.create(
      trip_date: date,
      alias: route.alias,
      distance_in_meter: route.distance_in_meter
    )
  end

  private

  def copy_to_date(date)
    self.dup.tap do |new_trip|
      new_trip.update(trip_date: date)
    end
  end

  def next_working_day(date)
    date + 1.working.days
  end
end
