class Restaurant < ActiveRecord::Base
  attr_accessible :address, :name
  has_many :meals
  has_many :dishes, through: :meals
  has_many :users, through: :meals

end
