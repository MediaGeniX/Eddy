class AddFromAndToToTrips < ActiveRecord::Migration
  def change
    add_reference :trips, :from
    add_reference :trips, :to
  end
end
