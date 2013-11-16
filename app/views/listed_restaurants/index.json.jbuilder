json.array!(@listed_restaurants) do |listed_restaurant|
  json.extract! listed_restaurant, 
  json.url listed_restaurant_url(listed_restaurant, format: :json)
end
