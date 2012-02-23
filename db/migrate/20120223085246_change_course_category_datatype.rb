class ChangeCourseCategoryDatatype < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.change :category_of_course, :integer
    end
  end


  def self.down
    t.change :category_of_course, :string
  end
end
