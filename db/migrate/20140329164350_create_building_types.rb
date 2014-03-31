class CreateBuildingTypes < ActiveRecord::Migration
  def change
    create_table :building_types do |t|
      t.float :cycle_time
      t.string :name
      t.string :icon_name
      t.references :resource_type

      t.timestamps
    end
  end
end
