json.data do
  json.partial! 'api/v1/shared/profile', profile: @current_user
end
