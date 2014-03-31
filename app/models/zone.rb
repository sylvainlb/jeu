class Zone < ActiveRecord::Base
  belongs_to :region
  belongs_to :building_type
  has_many :stocks, :dependent => :destroy
  has_many :fleets, :dependent => :destroy
  attr_accessible :coordX, :coordY
  attr_accessible :building_type_id, :region_id
  attr_accessor :population, :productivity

  validates :building_type_id, :coordX, :coordY, :region_id, :presence => :true

  validates :coordX,:coordY, :numericality => { less_than: 1000, greater_than: 1}

  validate :square_radius

  after_create :stock_generation


  def population
    stocks.joins(:resource_type).where(resource_types: {name: 'People'}).sum(:nb_resource)
  end

  def productivity
    population * building_type.output
  end

  def distance_coord(x,y)
    Math.sqrt((coordX-x)**2 + (coordY-y)**2 )
  end

  def square_radius
    radius=40
    tooClose=Zone.where(:coordX => (self.coordX-radius..self.coordX+radius), :coordY => (self.coordY-radius..self.coordY+radius))
    errors.add(:coordX,'too close to an existing zone') unless tooClose.empty?
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
  end
end
