class Trip < ActiveRecord::Base
  attr_accessible :name, :subtitle, :description, :location, :latitude, :longitude, :gmaps, :cover_photo, :current_trip_instance
  has_many :trip_instances
  has_many :posts
  has_many :partners
  has_one :current_trip_instance, :class_name => "TripInstance"
  has_attached_file :cover_photo, :styles => { :large => "600x>"}, :storage => :s3, 
  :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "/:style/:id/:filename"

  # this lets the gmaps gem know that this model can be plotted on a map
  acts_as_gmappable

  # this tells the gmaps gem where to plot the location of each trip
  def gmaps4rails_address
  	"2226 Parker, Berkeley, CA 94702"
  end

end
