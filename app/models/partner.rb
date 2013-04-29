class Partner < ActiveRecord::Base
  attr_accessible :description, :name, :website, :trip_id, :logo, :partner_id
  belongs_to :trip
  has_attached_file :logo, :styles => { :medium => "400x>", :thumb => "50x50>"}, :storage => :s3,
    :s3_credentials => S3_CREDENTIALS, :path => "/:style/:id/:filename"
end
