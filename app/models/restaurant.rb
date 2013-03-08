class Restaurant < ActiveRecord::Base
  attr_accessible :address, :name, :phone_number, :district, :postcode, :city, :country, :lat, :lng

  validates_presence_of :address, :name


  has_many :meals
  has_many :dishes, through: :meals
  has_many :users, through: :meals

end
