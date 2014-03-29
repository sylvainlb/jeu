class Stock < ActiveRecord::Base
   attr_accessible :title, :body
   belongs_to zone
   has_one :ressourceType, :dependent => :destroy
end
