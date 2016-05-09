json.extract! meal, :id, :cereal, :fruit, :vegetable, :meat,
                    :dairy, :sweets, :fats
json.consumed_at meal.consumed_at.to_s
json.created_at  meal.created_at.to_s
json.updated_at  meal.updated_at.to_s
