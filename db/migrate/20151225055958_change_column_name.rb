class ChangeColumnName < ActiveRecord::Migration
  def change
  	remove_index(:pins, :name => 'index_pins_on_name') 
  	rename_column :pins, :name, :user_name
  end
end
