class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :distance
      t.datetime :trip_date

      t.timestamps null: false
    end
  end
end
