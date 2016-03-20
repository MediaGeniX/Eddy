class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date :trip_date,            null: false
      t.references :route
      t.references :user,           null: false
      t.string :alias,               null: false
      t.integer :distance_in_meter, null: false


      t.timestamps null: false
    end
  end
end
