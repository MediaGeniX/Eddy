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

  def self.to_csv(start_date, end_date)
    trips = self.where(trip_date: start_date..end_date).joins(:user).where("users.employee_number <> ''").group(:user).order('users.name DESC').sum(:distance_in_meter)
    trips_amount = self.where(trip_date: start_date..end_date).joins(:user).where("users.employee_number <> ''").select('DISTINCT trip_date').order('count_distinct_trip_date DESC').group(:user).count

    CSV.generate(headers: true) do |csv|
      csv << %w{name employer_number employee_number days_biked compensation}

      trips.each do |trip|
        user = trip.first
        amount_of_trips = trips_amount[user]
        csv << [user.name, "1WM0179", user.employee_number, amount_of_trips, trip.second / 1000 * 0.23]
      end
    end
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
