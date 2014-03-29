class Zone < ActiveRecord::Base
  belongs_to :region
  belongs_to :buildingType
  has_many :stocks, :dependent => :destroy
  has_many :fleets, :dependent => :destroy
  attr_accessible :coordX, :coordY
  attr_accessible :buildingType_id, :region_id
end
