class RenameCategorys < ActiveRecord::Migration
  def change
  	rename_table :categorys, :categories
  end
end
