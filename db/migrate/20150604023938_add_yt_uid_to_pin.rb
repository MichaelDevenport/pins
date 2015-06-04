class AddYtUidToPin < ActiveRecord::Migration
  def change
    add_column :pins, :yt_uid, :string
  end
end
