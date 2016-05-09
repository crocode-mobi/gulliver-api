json.extract! ranked_user, :id, :name, :location, :points, :total_steps, :total_distance
json.avatar do
  json.medium_url ranked_user.avatar.url(:medium)
  json.square_url ranked_user.avatar.url(:square)
end
