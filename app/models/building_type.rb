class BuildingType < ActiveRecord::Base
   attr_accessible :output, :name,:iconName
   has_one :ressourceType, :dependent => :destroy
end
