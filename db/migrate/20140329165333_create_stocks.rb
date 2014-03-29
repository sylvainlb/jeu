class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :zone
      t.integer :nbResource
      t.timestamps
    end
    add_index :stocks, :zone_id
  end
end
