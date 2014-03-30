class VehicleType < ActiveRecord::Base
  attr_accessible :capacity, :speed, :name
  has_many :fleets, :dependent => :destroy
end
