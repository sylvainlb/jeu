class CreateBuildingTypes < ActiveRecord::Migration
  def change
    create_table :building_types do |t|

      t.timestamps
    end
  end
end
