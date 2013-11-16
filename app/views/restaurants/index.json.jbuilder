json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :location, :data
  json.url restaurant_url(restaurant, format: :json)
end
