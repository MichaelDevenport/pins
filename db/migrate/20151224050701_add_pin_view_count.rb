class AddPinViewCount < ActiveRecord::Migration
  def change
  	add_column :pins, :view_count, :integer
  end
end
