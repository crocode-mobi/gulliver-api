json.data do
  json.partial! 'api/v1/shared/user', total_stages: @total_stages,
                                      user: @current_user,
                                      stages: @stages,
                                      badges: @badges
end
