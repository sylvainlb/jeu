class Stock < ActiveRecord::Base7
  belongs_to zone
  belongs_to :resourceType, :dependent => :destroy
  attr_accessible nbResource
end
