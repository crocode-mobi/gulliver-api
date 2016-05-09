json.data do
  json.partial! 'api/v1/shared/badge', collection: @badges, as: :badge
end
