class Fleet < ActiveRecord::Base
  belongs_to :vehicleType
  belongs_to :zone
  attr_accessible :nbVehicule
end
