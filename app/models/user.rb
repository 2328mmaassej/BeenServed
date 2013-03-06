class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :password_confirmation, :password_digest

  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email

  has_many :meals
  has_many :restaurants, through: :meals
  has_many :dishes, through: :meals

  has_secure_password

end
