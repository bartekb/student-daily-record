class CreateDivisionsUsersTable < ActiveRecord::Migration
  def self.up
    create_table :divisions_users, :id => false do |t|
        t.references :division
        t.references :user
    end
    add_index :divisions_users, [:division_id, :user_id]
    add_index :divisions_users, [:user_id, :division_id]
  end

  def self.down
    drop_table :divisions_users
  end
end
