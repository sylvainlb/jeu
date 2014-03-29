class Zone < ActiveRecord::Base
  belongs_to :region
  belongs_to :building_type
  has_many :stocks, :dependent => :destroy
  has_many :fleets, :dependent => :destroy
  attr_accessible :coordX, :coordY
  attr_accessible :building_type_id, :region_id

  validates :building_type_id, :coordX, :coordY, :region_id, :presence => :true
end
