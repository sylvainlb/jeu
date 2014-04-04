class AddUserToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :user_id, :integer
    add_index :regions, :user_id
  end
end
