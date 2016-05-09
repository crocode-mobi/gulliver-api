json.extract! tip, :id, :title, :description, :section
json.created_at tip.created_at.to_s
json.updated_at tip.updated_at.to_s
