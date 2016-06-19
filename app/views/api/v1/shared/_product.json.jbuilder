json.extract! product, :id, :title, :subtitle, :description, :points

json.image do
  json.medium_url product.image.url(:medium)
  json.square_url product.image.url(:square)
end

json.created_at product.created_at.to_s
json.updated_at product.updated_at.to_s
