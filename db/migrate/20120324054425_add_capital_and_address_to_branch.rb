class AddCapitalAndAddressToBranch < ActiveRecord::Migration
  def self.up
    add_column :branches, :branchstate, :string
    add_column :branches, :branchaddress, :string
  end

  def self.down
    remove_column :branches,:branchstate
    remove_column :branches,:branchaddress
  end
end
