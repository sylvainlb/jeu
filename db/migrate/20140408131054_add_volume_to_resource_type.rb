class AddVolumeToResourceType < ActiveRecord::Migration
  def change
    add_column :resource_types, :volume, :integer
  end
end
