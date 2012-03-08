class AddSlugToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :slug, :string
    add_index :courses, :slug
  end

  def self.down
    remove_column :courses, :slug
  end
end

