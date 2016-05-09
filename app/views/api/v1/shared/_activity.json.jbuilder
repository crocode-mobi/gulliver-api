json.extract!   activity, :id, :steps, :distance, :kcal
json.done_at    activity.done_at.to_s
json.created_at activity.created_at.to_s
json.updated_at activity.updated_at.to_s
