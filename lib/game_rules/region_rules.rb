module RegionRules

  REGION_BUILDINGS = {
      max_cities: 5,
      max_farms: 5,
      max_iron_mines: 5,
      max_sawmills: 5,
      max_factories: 5
  }


  def zones_generation
    #TODO Balance zones generation
    #Generate some randomness

    cities=rand(1..REGION_BUILDINGS[:max_cities])
    farms=rand(1..REGION_BUILDINGS[:max_farms])
    iron_mines=rand(1..REGION_BUILDINGS[:max_iron_mines])
    sawmills=rand(1..REGION_BUILDINGS[:max_sawmills])
    factories=rand(1..REGION_BUILDINGS[:max_factories])


    cities.times do
      zone=self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type:'city')
      unless zone.save
        redo
      end
    end

    farms.times do
      zone=self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type:'farm')
      unless zone.save
        redo
      end
    end

    iron_mines.times do
      zone=self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type:'iron_mine')
      unless zone.save
        redo
      end
    end

    sawmills.times do
      zone=self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type:'sawmill')
      unless zone.save
        redo
      end
    end

    factories.times do
      zone=self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type:'factory')
      unless zone.save
        redo
      end
    end

  end
end