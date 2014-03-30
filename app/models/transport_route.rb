class TransportRoute < ActiveRecord::Base
  belongs_to :origin, class_name: Zone
  belongs_to :destination, class_name: Zone
  belongs_to :fleet
  belongs_to :resource_type
  attr_accessible :quantity, :origin_id, :destination_id, :fleet_id, :resource_type_id
  attr_accessor :name

  def name
    origin.id.to_s+' -> '+ destination.id.to_s
  end
end
