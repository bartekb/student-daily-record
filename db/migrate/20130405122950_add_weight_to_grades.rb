class AddWeightToGrades < ActiveRecord::Migration
  def up
    add_column :grades, :weight_id, :integer
    add_index :grades, :weight_id
  end

  def down
    remove_column :grades, :weight_id
  end
end
