class Restaurant < ActiveRecord::Base
  attr_accessible :address, :name, :phone_number, :district, :postcode, :city, :country, :lat, :lng, :meal_attributes, :dish_attributes, :user_attributes

  validates_presence_of :address, :name

  has_many :meals
  has_many :dishes, through: :meals
  has_many :users, through: :meals

  accepts_nested_attributes_for :meals, :dishes, :users

end
