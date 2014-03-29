class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.integer :nbVehicule
      t.references :vehicleType
      t.references :zone

      t.timestamps
    end
    add_index :fleets, :vehicleType_id
    add_index :fleets, :zone_id
  end
end
