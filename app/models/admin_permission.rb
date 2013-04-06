class AdminPermission < ActiveRecord::Base
  attr_accessible :user
  belongs_to :user
end
