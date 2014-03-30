class Zone < ActiveRecord::Base
  belongs_to :region
  belongs_to :building_type
  has_many :stocks, :dependent => :destroy
  has_many :fleets, :dependent => :destroy
  attr_accessible :coordX, :coordY
  attr_accessible :building_type_id, :region_id

  validates :building_type_id, :coordX, :coordY, :region_id, :presence => :true

  validates :square_radius


  def distance_coord(x,y)
    Math.sqrt((coordX-x)**2 + (coordY-y)**2 )
  end

  def square_radius
    radius=40
    tooClose=Zone.where(:coordX => (self.coordX-radius..self.coordX+radius), :coordY => (self.coordY-radius..self.coordY+radius))
    unless tooClose.empty?
      errors.add(:coordX,'too close to an existing zone')
    end
  end
end
