class BuildingType < ActiveRecord::Base
  attr_accessible :output, :name, :iconName
  belongs_to :ressourceType
  has_many :zones, :dependent => :destroy
end
