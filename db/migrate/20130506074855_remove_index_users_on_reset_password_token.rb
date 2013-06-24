class RemoveIndexUsersOnResetPasswordToken < ActiveRecord::Migration
  def up
    remove_index :users, :name => "index_users_on_reset_password_token"
  end

  def down
  end
end
