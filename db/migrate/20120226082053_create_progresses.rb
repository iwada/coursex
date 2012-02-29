class CreateProgresses < ActiveRecord::Migration
  def self.up
    create_table :progresses do |t|
      t.integer :course_id
      t.integer :employee_id
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :progresses
  end
end
