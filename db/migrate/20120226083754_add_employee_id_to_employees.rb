class AddEmployeeIdToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :employee_id, :integer
  end

  def self.down
  end
end
