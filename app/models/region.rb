class Region < ActiveRecord::Base

  has_many :zones, :dependent => :destroy
  has_many :fleets, :through => :zones
  has_many :transport_routes, :through => :fleets
  belongs_to :user
  attr_accessible :name, :user_id

  after_create :zones_generation

  def zones_generation
    #TODO Balance zones generation
    #Generate some randomness
    nbCity=rand(4)+1
    nbChamps=rand(4)+1
    nbMineFer=rand(4)+1
    nbMineForet=rand(4)+1
    nbFactory=rand(4)+1

    buildingTypeVille= BuildingType.where(:name => "City" ).first
    buildingTypeChamps= BuildingType.where(:name => "Field" ).first
    buildingTypeMinesFer= BuildingType.where(:name => "Iron Mine" ).first
    buildingTypeForet= BuildingType.where(:name => "Sawmill" ).first
    buildingTypeFactory= BuildingType.where(:name => "Factory" ).first

    cityNb=0
    champsNb=0
    minesNb=0
    foretNb=0
    factoryNb=0

    while cityNb < nbCity
      createBool = self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeVille.id)
      if createBool.save
        cityNb=cityNb+1
      end
    end

    while champsNb < nbChamps
      createBool = self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeChamps.id)
      if createBool.save

        champsNb=champsNb+1
      end
    end

    while minesNb < nbMineFer
      createBool = self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeMinesFer.id)
      if createBool.save

        minesNb=minesNb+1
      end
    end

    while foretNb < nbMineForet
      createBool = self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeForet.id)
      if createBool.save

        foretNb=foretNb+1
      end
    end

    while factoryNb < nbFactory
      createBool = self.zones.new(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeFactory.id)
      if createBool.save

        factoryNb=factoryNb+1
      end
    end

  end
end
