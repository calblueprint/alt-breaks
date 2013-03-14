class Testimony < ActiveRecord::Base
  attr_accessible :context, :trip_instance_id, :user_id, :photo
  attr_accessor :photo_file_name
  belongs_to :trip_instance
  belongs_to :user
  has_many :photos
  has_attached_file :photo
end
