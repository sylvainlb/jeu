class BuildingType < ActiveRecord::Base

  belongs_to :resource_type
  has_many :zones, :dependent => :destroy

  attr_accessible :cycle_time, :name, :icon_name
  attr_accessible :resource_type_id
end
