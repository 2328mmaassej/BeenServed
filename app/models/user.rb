class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  has_many :meals
  has_many :restaurants, through: :meals
  has_many :dishes, through: :meals

end
