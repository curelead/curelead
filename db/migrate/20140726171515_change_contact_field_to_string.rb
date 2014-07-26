class ChangeContactFieldToString < ActiveRecord::Migration
  def change
    change_column :users, :contact_number, :string
  end
end
