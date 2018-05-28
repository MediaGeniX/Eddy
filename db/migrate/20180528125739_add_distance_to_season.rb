class AddDistanceToSeason < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :distance_in_meter, :integer, default: 25000000
  end
end
