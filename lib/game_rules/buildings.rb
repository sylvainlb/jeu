module Buildings

  BUILDINGS = YAML.load_file('lib/game_rules/buildings.yml')

  #Building people and food rules
    #What if no food, same rate everywhere : starving people ARE starving
  DEATH_RATE = 20.0/3600 #50 people will die every hour (divided by 3600 for the death/seconds)

    #Eating rates : Working people will eat the same... no fooling around in this universe
  FOOD_RATE = 1.0/3600 # 2 food per hour per people (in food/seconds)
    #starting range population and food for cities and other zones
  CITY_START = {
      population: 200..1000,
      food: 2000..10000
  }
  NOT_CITY_START = {
      population: 5..20,
      food: 30..60
  }
  FLEET_START = {
      fleets: 0..2,
      vehicles: 0..4
  }

  #Below are methods for class Zone mixins.
  #getters
  def max_pop
    BUILDINGS[building_type][:max_pop]
  end
  def max_food
    BUILDINGS[building_type][:max_food]
  end
  def output_products
    BUILDINGS[building_type][:output][:products] #Returns an hash with an array of resources of hashes {prod_time: Y, resources:['resource','resource']}
  end
  def prod_time
    BUILDINGS[building_type][:output][:prod_time]
  end
  def type_name
    BUILDINGS[building_type][:name]
  end
  def death_rate
    DEATH_RATE
  end
  def food_rate
    FOOD_RATE
  end


  #Stock generation
  def stock_generation

    pop_city=rand(CITY_START[:population])
    food_city=rand(CITY_START[:food])
    pop_not_city=rand(NOT_CITY_START[:population])
    food_not_city=rand(NOT_CITY_START[:food])
    nb_fleets=rand(FLEET_START[:fleets])
    nb_vehicles=rand(FLEET_START[:vehicles])


    if self.building_type=='city'
      self.stocks.create(resource_type: 'population', nb_resource: pop_city)
      self.stocks.create(resource_type: 'food', nb_resource: food_city)
    else
      self.stocks.create(resource_type: 'population', nb_resource: pop_not_city)
      self.stocks.create(resource_type: 'food', nb_resource: food_not_city)
    end

    nb_fleets.times do
      self.fleets.create(nb_vehicle: nb_vehicles, vehicle_type:'vehicle', region_id: self.region_id)
    end

    self.start_production
  end


end
