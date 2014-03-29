class Zone < ActiveRecord::Base
  belongs_to :region, :dependent => :destroy
  belongs_to :buildingType, :dependent => :destroy
  has_many :stocks
  has_many :fleets
  attr_accessible :coordX, :coordY
end
