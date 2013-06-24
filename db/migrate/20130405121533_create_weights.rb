class CreateWeights < ActiveRecord::Migration
  def up
    create_table :weights do |t|
      t.integer :school_id
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :weights
  end
end
