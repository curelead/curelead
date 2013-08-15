class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name

      t.timestamps
    end
    remove_column :posts, :sizes
    add_column :posts, :size_id, :integer
  end
end
