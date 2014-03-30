class Fleet < ActiveRecord::Base
  belongs_to :vehicle_type
  belongs_to :zone
  belongs_to :current_route, :class_name => TransportRoute
  has_many :transport_routes, :dependent => :destroy

  attr_accessible :nb_vehicle, :vehicle_type_id, :zone_id, :departure, :arrival, :current_route_id

end
