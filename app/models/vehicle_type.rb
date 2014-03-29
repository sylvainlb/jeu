class VehicleType < ActiveRecord::Base
  attr_accessible :capacity, :speed
  has_many :fleets
end
