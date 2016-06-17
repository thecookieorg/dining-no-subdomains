json.array!(@product_taxes) do |product_tax|
  json.extract! product_tax, :id, :name, :value
  json.url product_tax_url(product_tax, format: :json)
end
