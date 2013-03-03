class Dish < ActiveRecord::Base
  attr_accessible :category

  validates_presence_of :category
  validates_uniqueness_of :category

  has_many :meals
  has_many :restaurants, through: :meals
  has_many :users, through: :meals

end
