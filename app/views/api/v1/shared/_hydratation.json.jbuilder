json.extract! hydratation, :id, :quantity
json.centiliters hydratation.to_centiliters
json.level hydratation.level
json.consumed_at hydratation.consumed_at.to_s
json.created_at hydratation.created_at.to_s
json.updated_at hydratation.updated_at.to_s
