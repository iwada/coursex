class AddAdminUsers < ActiveRecord::Migration
  def self.up

    add_column :users, :admin, :boolean,:default => false
    add_column :users, :employee, :boolean,:default => false
  end

  def self.down

  end
end
