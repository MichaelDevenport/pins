class AddCatergoryIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :catergory_id, :integer
  end
end
