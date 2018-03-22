class ConfirmAllUsers < ActiveRecord::Migration[5.1]
  def change
      User.all.update_all confirmed_at: DateTime.now
  end
end
