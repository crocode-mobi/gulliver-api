json.data do
  json.today do
    json.partial! 'api/v1/shared/meal', meal: @today_meal
  end

  json.historical do
    json.partial! 'api/v1/shared/meal', collection: @until_today_meals, as: :meal
  end
end
