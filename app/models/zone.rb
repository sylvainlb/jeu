class Zone < ActiveRecord::Base
  belongs_to :region
  belongs_to :building_type
  has_many :stocks, :dependent => :destroy
  has_many :fleets, :dependent => :destroy
  attr_accessible :coordX, :coordY
  attr_accessible :building_type_id, :region_id, :next_production_time, :production_start_time
  attr_accessor :population, :next_cycle_time

  validates :building_type_id, :coordX, :coordY, :region_id, :presence => :true

  validates :coordX,:coordY, :numericality => { less_than: 1000, greater_than: 1}

  validate :square_radius

  after_create :stock_generation


  def population
    stocks.joins(:resource_type).where(resource_types: {name: 'People'}).sum(:nb_resource)
  end

  def next_cycle_time
    building_type.cycle_time / population
  end

  def product!
    stock=self.stocks.where('resource_type_id = ?', building_type.resource_type_id).first || self.stocks.create(resource_type_id: self.building_type_id,nb_resource:0)
    next_time=self.next_cycle_time
    while self.next_production_time < Time.now do
      self.production_start_time=next_production_time || Time.now
      self.next_production_time=next_production_time+next_time+1
      stock.nb_resource=stock.nb_resource+1
    end
    stock.save
    self.save
  end

  def distance_coord(x,y)
    Math.sqrt((coordX-x)**2 + (coordY-y)**2 )
  end

  def square_radius
    radius=40
    tooClose=Zone.where(:coordX => (self.coordX-radius..self.coordX+radius), :coordY => (self.coordY-radius..self.coordY+radius)).where('id != ?',self.id)
    errors.add(:coordX,'too close to an existing zone') unless tooClose.empty?
  end

  def start_production
    self.production_start_time=Time.now
    self.next_production_time=self.production_start_time+next_cycle_time
    self.save
  end

  def stock_generation

    nbpersonneville=rand(800)+200
    nbnouritureville=rand(8000)+2000
    nbnouritureautre=rand(30)+30
    nbnersonneautre=rand(15)+5

    resourceTypePeople= ResourceType.where(:name => "People" ).first
    resourceTypeFood= ResourceType.where(:name => "Food" ).first

    if self.building_type.name=="City"
    self.stocks.create(resource_type_id:resourceTypePeople.id, nb_resource:nbpersonneville)
    self.stocks.create(resource_type_id:resourceTypeFood.id, nb_resource:nbnouritureville)
    end

    if  self.building_type.name!="City"
     self.stocks.create(resource_type_id:resourceTypePeople.id, nb_resource:nbnersonneautre)
    self.stocks.create(resource_type_id:resourceTypeFood.id, nb_resource:nbnouritureautre)
    end

    self.start_production
  end
end
