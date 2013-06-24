class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :user_id
      t.integer :school_id

      t.timestamps
    end
  end
end
