class Trip < ActiveRecord::Base
  attr_accessible :description, :location
  has_many :trip_instances
end
