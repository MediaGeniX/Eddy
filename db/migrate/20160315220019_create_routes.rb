class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :user
      t.references :from
      t.references :to
      t.integer :distance

      t.timestamps null: false
    end
  end
end
