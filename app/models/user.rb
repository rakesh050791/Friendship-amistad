class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:country,:state,:city,:zipcode
  # attr_accessible :title, :body
  geocoded_by :country
  after_validation :geocode, :if => :country_changed?
  
  include Amistad::FriendModel
  
end
