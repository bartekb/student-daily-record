class CreateGrades < ActiveRecord::Migration
  def up
    create_table :grades do |t|
      t.integer :user_id
      t.integer :student_id
      t.integer :subject_id
      t.string :value
      t.text :description
      t.boolean :is_semester, :default => :false

      t.timestamps
    end
  end

  def down
    drop_table :grades
  end
end
