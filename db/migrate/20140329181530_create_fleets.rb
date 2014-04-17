class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.integer :nb_vehicle
      t.string :vehicle_type
      t.references :zone
      t.references :current_route
      t.timestamp :arrival
      t.timestamp :departure

      t.timestamps
    end
    add_index :fleets, :vehicle_type
    add_index :fleets, :zone_id
    add_index :fleets, :current_route_id
  end
end
