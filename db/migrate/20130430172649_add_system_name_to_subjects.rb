class AddSystemNameToSubjects < ActiveRecord::Migration
  def up
    add_column :subjects, :system_name, :string
  end

  def down
    drop_column :subjects, :system_name
  end
end
