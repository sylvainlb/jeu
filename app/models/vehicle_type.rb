class VehicleType < ActiveRecord::Base
  attr_accessible :capacity, :speed, :name, :max_volume
  has_many :fleets, :dependent => :destroy

  validates :capacity, presence: true
end
