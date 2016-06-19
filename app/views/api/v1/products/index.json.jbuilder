json.data do
  json.partial! 'api/v1/shared/product', collection: @products, as: :product
end
