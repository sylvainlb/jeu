class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.references :region
      t.references :building_type
      t.integer :coordX
      t.integer :coordY
      t.timestamp :next_production_time
      t.timestamp :production_start_time

      t.timestamps
    end
    add_index :zones, :region_id
    add_index :zones, :building_type_id
  end
end
