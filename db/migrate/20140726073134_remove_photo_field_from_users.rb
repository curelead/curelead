class RemovePhotoFieldFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :photo, :binary
  end
end
