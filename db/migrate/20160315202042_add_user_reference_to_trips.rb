class AddUserReferenceToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :user_id, :reference
  end
end
