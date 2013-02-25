class TripPermission < ActiveRecord::Base
  attr_accessible :trip_instance_id, :user_id, :permission
end
