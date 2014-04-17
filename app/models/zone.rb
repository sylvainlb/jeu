class Zone < ActiveRecord::Base
  include Buildings

  belongs_to :region
  has_many :stocks, :dependent => :destroy
  has_many :fleets, :dependent => :destroy
  attr_accessible :coordX, :coordY
  attr_accessible :building_type, :region_id, :next_production_time, :production_start_time
  attr_accessible :last_food_time, :starving_start_time
  attr_accessor :next_cycle_time

  validates :building_type, :coordX, :coordY, :region_id, :presence => :true

  validates :coordX,:coordY, :numericality => { less_than: 1000, greater_than: 1}

  validate :square_radius

  after_create :stock_generation

  def stocks_of(resource)
    stocks.where(resource_type: resource).sum(:nb_resource)
  end

  def next_cycle_time #not in the rules because needs population or whatever
    self.prod_time*stocks_of('population')/(max_pop/2) # with a bonus/malus for population
  end

  def starve!
    #if no food, then people start to DIIIIIIE! using the DEATH_RATE
    unless self.starving_start_time.nil?
      puts("zone id : #{self.id}")
      population=stocks_of('population')
      unless population<=0
        interval=Time.now-self.starving_start_time
        dead_people=death_rate*interval
        (dead_people>population)? new_pop=0 : new_pop=population-dead_people
        pop_stock=stocks.where('resource_type = ?', 'population').first
        pop_stock.update_attributes(nb_resource:new_pop)
      end
      self.update_attributes(starving_start_time:Time.now, last_food_time:Time.now)
    end
  end

  def population_eat_food! #Using the consumption rate FOOD_RATE
    puts("zone id : #{self.id}")
    interval= Time.now-self.last_food_time
    puts("interval : #{interval}")
    population=stocks_of('population')
    eaten_food=population*food_rate*interval
    puts("Eaten food : #{eaten_food}")
    foods=stocks_of('food')
    puts("stocks foods : #{foods}")

    if !starving_start_time.nil?
      #do NOTHING, people are starving
      puts('starving already')
    elsif eaten_food >= foods
      puts('missing food')
      starv_interval=(eaten_food-foods)/(self.food_rate*population)
      puts("starv interval : #{starv_interval}")
      starv_delay=interval*foods/eaten_food
      puts("starv_delay: #{starv_delay}")
      self.starving_start_time = last_food_time+starv_delay
      self.last_food_time = starving_start_time
      food_stocks=stocks.where('resource_type = ?','food')
      food_stocks.update_all(nb_resource:0)
      self.save
    else
      puts('enough food')
      food_stock=stocks.where('resource_type = ?', 'food').first
      new_food=foods-eaten_food
      puts("new food : #{new_food}")
      food_stock.update_attributes(nb_resource:new_food)
      self.last_food_time=Time.now
      self.starving_start_time=nil
      self.save
    end

  end

  def produce!
    next_time=self.next_cycle_time

    #calculate numbers of producted resources (if cycle_time is short opposed to the update rhythm)
    nb_resource_to_product=(Time.now-production_start_time)/next_time

    #update timestamps
    self.production_start_time=production_start_time+(next_time*nb_resource_to_product.floor) || Time.now
    self.next_production_time=production_start_time+next_time

    #update stocks (if different products at the same time)
    produced_resources=self.output_products

    produced_resources.each do |resource|
      stock=self.stocks.where('resource_type = ?', resource).first_or_initialize(resource_type:resource,nb_resource:0)
      stock.nb_resource=stock.nb_resource+nb_resource_to_product
      stock.save
    end
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
    self.last_food_time=Time.now
    self.save
  end

end
