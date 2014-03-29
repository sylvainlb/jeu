class CreateBuildingTypes < ActiveRecord::Migration
  def change
    create_table :building_types do |t|
      t.float :output
      t.string :name
      t.string :iconName

      t.timestamps
    end
  end
end
