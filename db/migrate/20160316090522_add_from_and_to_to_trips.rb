class AddFromAndToToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :from_id, :reference
    add_column :trips, :to_id, :reference
  end
end
