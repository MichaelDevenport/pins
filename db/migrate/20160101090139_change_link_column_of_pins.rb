class ChangeLinkColumnOfPins < ActiveRecord::Migration
  
  def self.up
		change_column :pins, :link, :text
	end
end
