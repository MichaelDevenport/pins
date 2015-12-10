class AddCategoryIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :category_id, :integer
  end
end
