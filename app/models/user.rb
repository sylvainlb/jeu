class User < ActiveRecord::Base
  attr_accessible :name
  has_many :regions

  after_create :set_default_name

  def set_default_name
    self.name="User #{self.id}"
    self.save
  end
end
