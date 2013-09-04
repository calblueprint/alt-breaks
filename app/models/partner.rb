class Partner < ActiveRecord::Base
  attr_accessible :description, :name, :website, :trip_id, :logo, :partner_id, :latitude, :longitude
  has_and_belongs_to_many :trip_instances
  has_attached_file :logo, :styles => { :medium => "400x>", :small => "140x140>", :thumb => "50x50>"}, :storage => :s3,
  :s3_credentials => S3_CREDENTIALS, :path => "/:style/:id/:filename"
end
