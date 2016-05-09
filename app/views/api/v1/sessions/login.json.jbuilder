json.data do
  json.partial! 'api/v1/shared/user_session', locals: { user: @user, token: @token }
end
