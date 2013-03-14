class Meal < ActiveRecord::Base
  attr_accessible :dish_id, :picture, :rating, :restaurant_id, :review, :user_id, :picture_cache, :restaurant_attributes, :dish_attributes, :user_attributes

  validates_presence_of :dish_id, :rating, :restaurant_id, :review, :user_id

  belongs_to :dish
  belongs_to :restaurant
  belongs_to :user

  mount_uploader :picture, PictureUploader

  # accepts_nested_attributes_for :restaurants, :dishes, :users

end
