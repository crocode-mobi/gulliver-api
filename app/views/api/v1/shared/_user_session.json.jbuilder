json.extract! user, :id, :name, :email, :genre, :weight, :height, :location,
                    :total_steps, :total_distance, :total_kcal, :total_days_running,
                    :points

json.birthday user.birthday.to_s

json.avatar do
  json.medium_url user.avatar.url(:medium)
  json.square_url user.avatar.url(:square)
end

json.created_at user.created_at.to_s
json.updated_at user.updated_at.to_s

json.extract! token, :token
