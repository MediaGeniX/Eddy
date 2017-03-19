class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :default, null: false, default: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
