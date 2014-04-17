class Stock < ActiveRecord::Base
  include Resources
  belongs_to :zone
  attr_accessible :nb_resource, :zone_id, :resource_type
end
