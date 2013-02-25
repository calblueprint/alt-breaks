class TripInstance < ActiveRecord::Base
  attr_accessible :description, :year
  belongs_to :trip
  has_many :posts
  has_many :trip_permissions
  has_many :testimonies
end
