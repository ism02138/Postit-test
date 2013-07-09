class RenameCategories < ActiveRecord::Migration
  def change
  	rename_table :categoryies, :categorys
  end
end
