class Testimony < ActiveRecord::Base
  attr_accessible :description, :trip_instance_id, :user_id, :photos_attributes, :trip_instance
  belongs_to :trip_instance
  belongs_to :user
end
