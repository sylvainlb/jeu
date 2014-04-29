class TransportRoute < ActiveRecord::Base
  include Resources
  belongs_to :origin, class_name: Zone
  belongs_to :destination, class_name: Zone
  belongs_to :fleet

  attr_accessible :quantity, :origin_id, :destination_id, :fleet_id, :resource_type
  attr_accessor :name

  def name
    origin.id.to_s+' -> '+ destination.id.to_s
  end

  def transported_volume
    quantity*volume
  end
end
