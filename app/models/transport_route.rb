class TransportRoute < ActiveRecord::Base
  include Resources
  belongs_to :destination, class_name: Zone
  belongs_to :next_route, class_name: TransportRoute, foreign_key: :next_route_id
  has_one :previous_route, class_name: TransportRoute, foreign_key: :next_route_id
  belongs_to :fleet

  attr_accessible :quantity, :action_order, :destination_id, :fleet_id, :next_route_id, :resource_type

  validates :destination_id, :fleet_id, :action_order, :resource_type, :presence => true

  validates :action_order, uniqueness: { scope: :fleet_id}

  before_validation :assign_order

  def assign_order
    last_order=TransportRoute.select(:action_order).where(:fleet_id => self.fleet_id).order(:action_order).last
    if last_order.nil?
      self.action_order=1
    else
      self.action_order=last_order.action_order+1
    end
  end

  def transported_volume
    quantity*volume
  end

end
