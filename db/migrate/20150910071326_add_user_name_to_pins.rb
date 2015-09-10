class AddUserNameToPins < ActiveRecord::Migration
  def change
    add_column :pins, :name, :string
    add_index :pins, :name
  end
end
