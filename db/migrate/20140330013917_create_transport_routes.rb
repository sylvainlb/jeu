class CreateTransportRoutes < ActiveRecord::Migration
  def change
    create_table :transport_routes do |t|
      t.integer :action_order
      t.references :destination
      t.references :fleet
      t.string :resource_type
      t.integer :quantity
      t.references :next_route

      t.timestamps
    end
    add_index :transport_routes, :fleet_id
  end
end
