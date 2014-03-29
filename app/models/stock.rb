class Stock < ActiveRecord::Base7
  belongs_to zone
  belongs_to :resourceType
  attr_accessible nbResource
end
