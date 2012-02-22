class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :sex
      t.integer :level
      t.integer :mobile

      t.timestamps
    end
  end
end
