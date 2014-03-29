class Zone < ActiveRecord::Base
  belongs_to :region
  belongs_to :buildingType
  attr_accessible :coordX, :coordY
end
