class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :domain, :unique => true

      t.timestamps
    end
  end
end
