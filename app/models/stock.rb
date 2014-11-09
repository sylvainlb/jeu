class Stock < ActiveRecord::Base
  include Resources
  belongs_to :zone
  belongs_to :fleet

  attr_accessible :nb_resource, :zone_id, :resource_type, :fleet_id

  validates :zone_id, :uniqueness => { :scope => :resource_type}
end
