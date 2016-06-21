json.array!(@location_hours) do |location_hour|
  json.extract! location_hour, :id, :name
  json.url location_hour_url(location_hour, format: :json)
end
