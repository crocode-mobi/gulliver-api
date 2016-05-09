json.data do
  json.partial! 'api/v1/shared/activity', collection: @activities, as: :activity
end
