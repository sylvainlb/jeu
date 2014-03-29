class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.integer :capacity
      t.float :speed
      t.timestamps
    end
  end
end
