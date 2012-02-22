class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :date_of_course
      t.string :time_of_course
      t.integer :roomnumber
      t.string :tutor
      t.string :category_of_course
      t.string :name
      t.string :description
      t.string :status
      t.string :duration
      t.integer :maxallowed

      t.timestamps
    end
  end
end