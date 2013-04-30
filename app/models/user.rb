class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  attr_accessible :grad_year, :major, :first_name, :last_name, :about_me
  has_many :testimonies
  has_many :responses
  has_many :posts
  has_many :trip_permissions
  has_one :admin_permission
  has_attached_file :avatar, :styles => { :medium => "400x400>", :small => "140x140>", :thumb => "50x50>"} # , :storage => :s3, 
    # :s3_credentials => S3_CREDENTIALS, :path => "/:style/:id/:filename"
  validates :first_name, :last_name, :presence => :true

  def name
    return first_name + " " + last_name
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin
    AdminPermission.where("user_id = #{self.id}").count > 0
  end

  # returns if this user is a break leader of any trip instance
  # or if they are a break leader of any one
  def is_break_leader(trip_instance=nil)
    if trip_instance.nil?
      TripPermission.where("user_id = #{self.id} AND permission = 1").count > 0
    else
      TripPermission.where("user_id = #{self.id} AND trip_instance_id = #{trip_instance.id} AND permission = 1").count > 0
    end
  end

  def self.admins
    User.where("id IN (SELECT user_id FROM admin_permissions)")
  end

  def self.break_leaders
    User.where("id IN (SELECT user_id FROM trip_permissions WHERE permission = 1)")
  end

  def self.break_group(trip_instance)
    User.where("id IN (SELECT user_id FROM trip_permissions WHERE trip_instance_id = #{trip_instance.id})")
  end
end
