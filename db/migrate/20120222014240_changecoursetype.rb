class Changecoursetype < ActiveRecord::Migration
  def up
    rename_column :courses, :type, :category
  end

  def down
  end
end
