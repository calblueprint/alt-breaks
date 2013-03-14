class Testimony < ActiveRecord::Base
  attr_accessible :context, :trip_instance_id, :user_id, :photo, :photo_file_name
  belongs_to :trip_instance
  belongs_to :user
  has_many :photos
  has_attached_file :photo, :styles => { :medium => "400x>", :thumb => "50x50>"}, :storage => :s3, 
  :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "/:style/:id/:filename"
end
