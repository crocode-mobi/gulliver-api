json.data do
  json.partial! 'api/v1/shared/stage', collection: @stages, as: :stage
end
