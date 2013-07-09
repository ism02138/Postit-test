class CreateCategoryies < ActiveRecord::Migration
  def change
    create_table :categoryies do |t|
    	t.string :name
    end
  end
end
