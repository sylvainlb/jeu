class Fleet < ActiveRecord::Base
  include Vehicles
  belongs_to :zone
  belongs_to :region
  belongs_to :departure_zone, :class_name => Zone
  belongs_to :current_route, :class_name => TransportRoute
  has_many :transport_routes, :dependent => :destroy, :order => 'action_order'
  has_many :stocks, :dependent => :destroy

 attr_accessible :nb_vehicle, :vehicle_type, :zone_id, :region_id, :departure_zone_id, :departure, :arrival, :current_route_id

  attr_accessor :max_volume

  validates :nb_vehicle, :vehicle_type, :region_id, presence: true

  def max_volume
    nb_vehicle*cargo
  end

=begin
  Status :
    -en route : :zone_id => nil, :departure_zone_id => a_zone_id,
               :departure and :arrival => times, :current_route_id => a_transportroute_id
    -stationned : :zone_id => a_zone_id, everything else nil
    -doing stuff : :zone_id => a_zone_id, :current_route_id => a_transportroute_id, :departure_zone = zone
                   (current_route.destination_id = a_zone_id)
=end

  def do_actions
  #   check status
    #is en_route?
    puts('starting fleet action')
    if zone_id.nil? && !current_route_id.nil?
      puts('fleet has arrived')
      self.zone=current_route.destination
      self.departure_zone=zone
      self.departure=nil
      self.arrival=nil
      self.save
    #   load_unload etc
      self.unload_stocks
      self.load_stocks

      self.start_routes

    else
    #   don't do stuff...
      puts('fleet is in limbo')
    end

  end

  def next_transportroute
=begin
    if current_route not nil
next_route in order
or none if next=current
or first route
    else
first_route

=end
    unless current_route.nil?
      next_route=self.transport_routes.where('action_order > ?', self.current_route.action_order).first
      if next_route.nil?
        first_route=self.transport_routes.first
        if first_route.id!=self.current_route_id
          first_route
        end
      else
        next_route
      end
    else
      self.transport_routes.first
    end
  end

  def unload_stocks
    puts('unloading everything')


  end

  def load_stocks
    puts('loading specified resource')

  end

  def time_to_destination(dest_zone)
    distance=self.zone.distance_zone(dest_zone)
    distance/speed
  end

  def start_routes
    # if next route available (and different from last), fleet goes, else stationed
    next_route=next_transportroute
    unless next_route.nil? && current_route==next_route
      self.departure=Time.now
      self.departure_zone=zone
      self.arrival=departure+time_to_destination(next_route.destination)
      self.current_route=next_route
      self.zone=nil
      self.save
      true
    else
      self.current_route=nil
      self.departure_zone=nil
      self.save
      false
    end

  end
end
