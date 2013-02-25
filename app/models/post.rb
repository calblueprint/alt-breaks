class Post < ActiveRecord::Base
  attr_accessible :description, :trip_instance_id, :user_id, :video_link
end
