class Restaurant < ActiveRecord::Base
	has_many :listed_restaurants
  has_many :users, through: :listed_restaurants
end
