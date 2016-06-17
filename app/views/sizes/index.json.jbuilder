json.array!(@sizes) do |size|
  json.extract! size, :id, :portion_size, :size_based_price, :size_description
  json.url size_url(size, format: :json)
end
