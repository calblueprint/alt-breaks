class Post < ActiveRecord::Base
  attr_accessible :description, :trip_instance_id, :user_id, :video_link, :title, :trip_id, :page_id
  has_many :responses
  belongs_to :user
  #post can belong to one of 3 places:
  belongs_to :trip_instance
  belongs_to :trip
  belongs_to :page

  validates :title, :description, :presence => :true
end
