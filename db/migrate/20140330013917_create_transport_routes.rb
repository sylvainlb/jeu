class CreateTransportRoutes < ActiveRecord::Migration
  def change
    create_table :transport_routes do |t|
      t.references :origin
      t.references :destination
      t.references :fleet
      t.string :resource_type
      t.integer :quantity

      t.timestamps
    end
    add_index :transport_routes, :origin_id
    add_index :transport_routes, :destination_id
    add_index :transport_routes, :fleet_id
    add_index :transport_routes, :resource_type
  end
end
