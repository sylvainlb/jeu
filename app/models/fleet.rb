class Fleet < ActiveRecord::Base
  belongs_to :vehicle_type
  belongs_to :zone
  attr_accessible :nb_vehicule
end
