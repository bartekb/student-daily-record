class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.integer :lp
      t.integer :division_id
      t.integer :school_id

      t.timestamps
    end
  end
end
