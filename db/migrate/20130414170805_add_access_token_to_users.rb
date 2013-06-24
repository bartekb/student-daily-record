class AddAccessTokenToUsers < ActiveRecord::Migration
  def up
    add_column :users, :access_token, :string
  end

  def down
    remove_column :users, :access_token
  end
end
