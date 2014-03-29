class CreateVehiculeTypes < ActiveRecord::Migration
  def change
    create_table :vehicule_types do |t|

      t.timestamps
    end
  end
end
