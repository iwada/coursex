class AddCourseIdToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :course_id, :integer
  end

  def self.down
  end
end
