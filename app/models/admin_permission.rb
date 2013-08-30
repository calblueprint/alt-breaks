class AdminPermission < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user, :user_id, :title, :permission

  STAFF = 1
  DIRECTOR = 2

  scope :director, where("permission = ?", DIRECTOR)
  scope :staff, where("permission = ?", STAFF)
end
