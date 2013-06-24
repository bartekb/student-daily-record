class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :folder_id
      t.text :recipient_names
      t.string :title
      t.text :body
      t.boolean :is_read, :default => false

      t.timestamps
    end

    create_table :message_recipients do |t|
      t.integer :message_id
      t.integer :user_id
    end

    create_table :folders do |t|
      t.integer :user_id
      t.string :name
    end

    User.all.each{|u| u.create_folders }
  end

  def down
    drop_table :message_recipients
    drop_table :messages
    drop_table :folders
  end
end
