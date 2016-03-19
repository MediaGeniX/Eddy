class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :user,           null: false
      t.string :from,               null: false
      t.string :to,                 null: false
      t.string :alias
      t.integer :distance_in_meter, null: false

      t.timestamps null: false
    end
  end
end
