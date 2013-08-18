class TripInstance < ActiveRecord::Base
  attr_accessible :description, :year, :trip, :trip_id, :season
  belongs_to :trip
  belongs_to :owner, :class_name => "Trip", :foreign_key => "current_owner_id"
  has_many :posts
  has_many :trip_permissions
  has_many :testimonies
  has_many :photos
  has_many :requests

  def name
    trip.name
  end

end
