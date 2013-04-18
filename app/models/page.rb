class Page < ActiveRecord::Base
	has_many :posts
  attr_accessible :description, :name, :permission
  #permission = 1: only break leaders/admins
  #permission = 2: all members
end
