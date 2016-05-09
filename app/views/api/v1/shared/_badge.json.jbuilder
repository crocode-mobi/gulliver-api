json.extract! badge, :id, :name
json.category badge.custom_fields[:category]
json.title badge.custom_fields[:title]
json.description badge.custom_fields[:description]
json.image badge.custom_fields[:image]
