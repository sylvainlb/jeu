class Stock < ActiveRecord::Base
  belongs_to :zone
  belongs_to :resource_type
  attr_accessible :nb_resource
end
