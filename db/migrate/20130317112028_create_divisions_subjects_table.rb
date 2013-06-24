class CreateDivisionsSubjectsTable < ActiveRecord::Migration
  def self.up
    create_table :divisions_subjects, :id => false do |t|
        t.references :division
        t.references :subject
    end
    add_index :divisions_subjects, [:division_id, :subject_id]
    add_index :divisions_subjects, [:subject_id, :division_id]
  end

  def self.down
    drop_table :divisions_subjects
  end
end
