class Region < ActiveRecord::Base
  include RegionRules

  has_many :zones, :dependent => :destroy
  has_many :fleets, :through => :zones
  has_many :transport_routes, :through => :fleets
  belongs_to :user
  attr_accessible :name, :user_id

  after_create :zones_generation
end
