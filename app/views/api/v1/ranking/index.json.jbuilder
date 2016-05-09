json.data do
  json.total @total
  json.users do
    json.partial! 'api/v1/shared/ranked_user', collection: @ranked_users, as: :ranked_user
  end
end
