class Post < ActiveRecord::Base
  attr_accessible :description, :trip_instance_id, :user_id, :video_link, :title, :trip_id
  has_many :responses
  belongs_to :user
  belongs_to :trip_instance
  belongs_to :trip
  validates :title, :description, :presence => :true
end
