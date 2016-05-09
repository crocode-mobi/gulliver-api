json.data do
  json.today do
    json.partial! 'api/v1/shared/hydratation', hydratation: @today_hydratations
  end

  json.historical do
    json.partial! 'api/v1/shared/hydratation', collection: @until_today_hydratations, as: :hydratation
  end
end
