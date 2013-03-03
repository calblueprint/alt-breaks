class Trip < ActiveRecord::Base
  attr_accessible :name, :subtitle, :description, :location
  has_many :trip_instances
end
