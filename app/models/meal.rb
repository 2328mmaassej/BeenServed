class Meal < ActiveRecord::Base
  attr_accessible :dish_id, :picture, :rating, :restaurant_id, :review, :user_id

  validates_presence_of :dish_id, :rating, :restaurant_id, :review, :user_id

  belongs_to :dish
  belongs_to :restaurant
  belongs_to :user
end
