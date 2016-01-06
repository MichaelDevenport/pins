class AddAdultIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :adult_id, :integer
  end
end
