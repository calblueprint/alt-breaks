class Testimony < ActiveRecord::Base
  attr_accessible :context, :trip_instance_id, :user_id
  belongs_to :trip_instance
  belongs_to :user
  has_many :photos
end
