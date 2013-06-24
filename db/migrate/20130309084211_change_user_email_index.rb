class ChangeUserEmailIndex < ActiveRecord::Migration
  def change
    add_column :users, :school_id, :integer
    remove_index :users, :email
    add_index :users, [:username, :school_id], :unique => true
  end
end
