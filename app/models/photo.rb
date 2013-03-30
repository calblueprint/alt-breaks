class Photo < ActiveRecord::Base
  attr_accessible :caption, :testimony_id, :photo
  belongs_to :testimony
  has_attached_file :photo, :styles => { :medium => "400x>", :thumb => "50x50>"}, :storage => :s3, 
  :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "/:style/:id/:filename"
end
