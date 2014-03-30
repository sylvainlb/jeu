class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.integer :nb_vehicle
      t.references :vehicle_type
      t.references :zone
      t.references :current_route
      t.timestamps :arrival
      t.timestamps :departure

      t.timestamps
    end
    add_index :fleets, :vehicle_type_id
    add_index :fleets, :zone_id
    add_index :fleets, :current_route_id
  end
end
