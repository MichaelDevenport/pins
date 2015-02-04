class AddPinIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :pin_id, :integer
  end
end
