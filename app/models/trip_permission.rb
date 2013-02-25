class TripPermission < ActiveRecord::Base
  attr_accessible :trip_instance_id, :user_id, :permission
  belongs_to :trip_instance
  belongs_to :user
end
