class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :grad_year, :major, :first_name, :last_name
  has_many :testimonies
  has_many :responses
  has_many :posts
  has_many :trip_permissions
  has_one :admin_permission
  has_attached_file :avatar, :styles => { :medium => "400x>", :thumb => "50x50>"}, :storage => :s3, 
  :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "/:style/:id/:filename"

  validates :first_name, :last_name, :presence => :true

  def name
    return first_name + " " + last_name
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
