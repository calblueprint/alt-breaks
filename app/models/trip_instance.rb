class TripInstance < ActiveRecord::Base
  attr_accessible :description, :year, :trip_id
  belongs_to :trip
  has_many :posts
  has_many :trip_permissions
  has_many :testimonies
  has_many :requests

  def name 
    trip.name
  end

end
