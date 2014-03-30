class Region < ActiveRecord::Base
  attr_accessible :name
  has_many :zones, :dependent => :destroy

  after_create :zones_generation



  def zones_generation
    #TODO Balance zones generation
    #Generate some randomness
    nbCity=rand(4)+1
    nbChamps=rand(4)+1
    nbMineFer=rand(4)+1
    nbMineForet=rand(4)+1
    nbFactory=rand(4)+1
    buildingtypes=BuildingType.all
    buildingTypeVille= BuildingType.where(:name => "City" )
    buildingTypeChamps= BuildingType.where(:name => "Field" )
    buildingTypeMinesFer= BuildingType.where(:name => "Iron mine" )
    buildingTypeForet= BuildingType.where(:name => "Sawmill" )
    buildingTypeFactory= BuildingType.where(:name => "Factory" )

    for cityNb in 1..nbCity
      self.zones.create(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeVille.id)
    end

    for champsNb in 1..nbChamps
     test = self.zones.create(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeChamps.id)
    end

    for minesNb in 1..nbMineFer
          self.zones.create(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeMinesFer.id)
    end

    for foretNb in 1..nbMineForet
      self.zones.create(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeForet.id)
    end

    for factoryNb in 1..nbFactory
      self.zones.create(coordX: rand(1000), coordY: rand(1000), building_type_id:buildingTypeFactory.id)
    end

  end
end
