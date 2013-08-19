class CoverPhoto < ActiveRecord::Base
  attr_accessible :page, :photo
  has_attached_file :photo, :styles => { :large => "800x>"}, :storage => :s3,
    :s3_credentials => S3_CREDENTIALS, :path => "/cover_photos/:style/:id/:filename"

  def self.about
    CoverPhoto.find_by_page("About")
  end

  def self.team
    CoverPhoto.find_by_page("Team")
  end

  def self.map
    CoverPhoto.find_by_page("Map")
  end
end
