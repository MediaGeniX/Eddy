class AddUserReferenceToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :user, :reference
  end
end
