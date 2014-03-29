class BuildingType < ActiveRecord::Base
  attr_accessible :output, :name, :iconName
  belongs_to :ressourceType, :dependent => :destroy
  has_many :zones
end
