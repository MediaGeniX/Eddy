class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :trip_date,         null: false
      t.references :route,           null: false
      t.references :user,            null: false

      t.timestamps null: false
    end
  end
end
