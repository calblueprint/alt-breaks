class Photo < ActiveRecord::Base
  attr_accessible :caption, :testimony_id, :photo, :photo_file_name, :user_id, :trip_instance_id
  belongs_to :trip_instance
  belongs_to :user
  has_attached_file :photo, :styles => { :medium => "400x>", :thumb => "50x50>"}, :storage => :s3,
    :s3_credentials => S3_CREDENTIALS, :path => "/testimonies/:style/:id/:filename"
end
