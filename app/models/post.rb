class Post < ActiveRecord::Base
  attr_accessible :description, :trip_instance_id, :user_id, :video_link, :title, :trip_id, :page_id, :pdf
  has_many :responses
  belongs_to :user
  #post can belong to one of 3 places:
  belongs_to :trip_instance
  belongs_to :trip
  belongs_to :page

  validates :title, :description, :presence => :true

  has_attached_file :pdf, :storage => :s3,
    :s3_credentials => S3_CREDENTIALS, :path => "/:style/:id/:filename"

  validates_attachment_content_type :pdf,
      :content_type => [ 'application/pdf' ],
      :message => "only pdf files are allowed"
end
