json.extract!   profile, :email, :name, :genre,
                    :location, :weight, :height
json.avatar do
  json.medium_url profile.avatar.url(:medium)
  json.square_url profile.avatar.url(:square)
end
json.birthday   profile.birthday.to_s
json.created_at profile.created_at.to_s
json.updated_at profile.updated_at.to_s
