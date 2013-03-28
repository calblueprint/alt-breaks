class Testimony < ActiveRecord::Base
  attr_accessible :context, :trip_instance_id, :user_id, :photos_attributes
  belongs_to :trip_instance
  belongs_to :user
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
end
