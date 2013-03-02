class Dish < ActiveRecord::Base
  attr_accessible :category
  has_many :meals
  has_many :restaurants, through: :meals
  has_many :users, through: :meals

end
