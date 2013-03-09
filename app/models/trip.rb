class Trip < ActiveRecord::Base
  attr_accessible :name, :subtitle, :description, :location, :current_trip_instance_id
  has_many :trip_instances
  has_many :posts
end
