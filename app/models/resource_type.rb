class ResourceType < ActiveRecord::Base
  attr_accessible :icon_name, :name
  has_many :building_types, :dependent => :destroy
end
