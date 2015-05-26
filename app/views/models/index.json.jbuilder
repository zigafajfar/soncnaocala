json.array!(@models) do |model|
  json.extract! model, :id, :name, :brand_id, :price, :description
  json.url model_url(model, format: :json)
end
