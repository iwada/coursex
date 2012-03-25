class AddTempToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :temp, :string
  end

  def self.down
    remove_column :user, :temp
  end
end
