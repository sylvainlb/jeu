class Region < ActiveRecord::Base
  attr_accessible :name
  has_many :zones, :dependent => :destroy

  after_create :zones_generation



  def zones_generation
    #TODO Balance zones generation
    #Generate some randomness
    nbCity=rand(4)+1
    buildingtypes=BuildingType.all


    for cityNb in 1..nbCity
      self.zones.create(coordX: rand(1000), coordY: rand(1000), building_type_id: buildingtypes[rand(buildingtypes.length)].id)
    end

  end
end
