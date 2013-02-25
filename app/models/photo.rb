class Photo < ActiveRecord::Base
  attr_accessible :caption, :testimony_id
  belongs_to :testimony
end
