class CreateAccesspins < ActiveRecord::Migration
  def self.up
    create_table :accesspins do |t|
      t.string :value
      t.boolean :status, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :accesspins
  end
end
