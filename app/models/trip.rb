class Trip < ActiveRecord::Base
  attr_accessible :name, :subtitle, :description, :location, :current_trip_instance_id
  has_many :trip_instances
  has_many :posts

  # this lets the gmaps gem know that this model can be plotted on a map
  acts_as_gmappable

  # this tells the gmaps gem where to plot the location of each trip
  def gmaps4rails_address
  	"2226 Parker, Berkeley, CA 94702"
  end
end
