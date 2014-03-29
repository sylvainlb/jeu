class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.integer :nb_vehicule
      t.references :vehicle_type
      t.references :zone

      t.timestamps
    end
    add_index :fleets, :vehicle_type_id
    add_index :fleets, :zone_id
  end
end
