json.array!(@locations) do |location|
  json.extract! location, :id, :name, :about, :phone, :email, :takeout, :delivery, :address
  json.url location_url(location, format: :json)
end
