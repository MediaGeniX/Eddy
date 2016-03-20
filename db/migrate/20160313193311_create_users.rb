class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,      null: false
      t.date :birthdate,   null: false
      t.integer :location, null: false, default: 0
      t.integer :sex,      null: false, default: 0
      t.boolean :admin,    null: false, default: false

      t.timestamps null: false
    end
  end
end
