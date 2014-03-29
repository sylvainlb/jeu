class ResourceType < ActiveRecord::Base
  attr_accessible :iconName, :name
  has_many :building_types
end
