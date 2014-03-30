class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :zone
      t.references :resource_type
      t.integer :nb_resource

      t.timestamps
    end
    add_index :stocks, :zone_id
    add_index :stocks, :resource_type_id
  end
end
