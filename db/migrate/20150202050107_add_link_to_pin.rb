class AddLinkToPin < ActiveRecord::Migration
  def change
    add_column :pins, :link, :string
  end
end
