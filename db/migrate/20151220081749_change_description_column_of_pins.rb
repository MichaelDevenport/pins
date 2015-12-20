class ChangeDescriptionColumnOfPins < ActiveRecord::Migration
  def self.up
		change_column :pins, :description, :text
	end
end
