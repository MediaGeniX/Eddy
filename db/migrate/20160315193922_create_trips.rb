class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :trip_date, null: false
      t.integer :distance,   null: false
      t.string :from,        null: false
      t.string :to,          null: false
      t.references :route
      t.references :user,    null: false

      t.timestamps null: false
    end
  end
end
