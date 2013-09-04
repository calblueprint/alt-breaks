class Trip < ActiveRecord::Base
  before_create :default_values

  attr_accessible :name, :subtitle, :description, :location, :latitude, :longitude, :gmaps, :cover_photo, :current_trip_instance, :zoom_level, :cover_photo_file_name, :cover_photo_content_type
  has_many :posts

  has_many :trip_instances
  has_one :current_trip_instance, :class_name => "TripInstance", :foreign_key => "current_owner_id"

  has_attached_file :cover_photo, :styles => { :large => "600x>"}, :storage => :s3,
    :s3_credentials => S3_CREDENTIALS, :path => "/:style/:id/:filename"

  # this lets the gmaps gem know that this model can be plotted on a map
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => false

  # TO DO!!!!!!!!!!!
  scope :mappable, where("latitude IS NOT NULL").joins(:current_trip_instance)

  scope :current, joins(:current_trip_instance)

  def default_values
    self.zoom_level = 5 if self.zoom_level.nil?
  end

  def break_leaders
    if current_trip_instance
      current_trip_instance.trip_permissions.where(:permission => TripPermission::BREAK_LEADER).map {|permission| permission.user}
    else
      []
    end
  end
end
