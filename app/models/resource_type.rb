class ResourceType < ActiveRecord::Base
  attr_accessible :icon_name, :name, :volume
  has_many :building_types, :dependent => :destroy

  validates :volume, presence: true
end
