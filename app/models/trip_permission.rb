class TripPermission < ActiveRecord::Base
  attr_accessible :trip_instance_id, :permission, :user
  belongs_to :trip_instance
  belongs_to :user

  BREAK_LEADER = 1
  MEMBER = 2
end
