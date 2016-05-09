json.extract! user, :id, :name, :location, :total_steps,
                    :total_distance, :total_kcal,
                    :total_days_running, :points

json.avatar do
  json.medium_url user.avatar.url(:medium)
  json.square_url user.avatar.url(:square)
end

current_stage = user.current_stage
json.current_stage do
  json.total_stages total_stages
  json.partial! 'api/v1/shared/stage', stage: current_stage
  json.distance_traveled current_stage.distance_traveled(user.total_distance)
end

json.badges do
  json.partial! 'api/v1/shared/badge', collection: @badges, as: :badge
end
