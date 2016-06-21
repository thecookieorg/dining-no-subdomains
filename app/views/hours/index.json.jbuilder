json.array!(@hours) do |hour|
  json.extract! hour, :id, :day, :start_time, :end_time, :closed
  json.url hour_url(hour, format: :json)
end
