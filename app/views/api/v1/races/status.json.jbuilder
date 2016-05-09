json.data do
  json.current_user do
    json.extract! @current_user, :id, :name, :location, :total_steps,
                        :total_distance, :total_kcal,
                        :total_days_running, :points
    json.avatar do
      json.medium_url @current_user.avatar.url(:medium)
      json.square_url @current_user.avatar.url(:square)
    end
  end

  json.current_stage do
    json.total_stages @total_stages
    json.partial! 'api/v1/shared/stage', stage: @current_stage
    json.distance_traveled @current_stage.distance_traveled(@current_user.total_distance)
  end

  json.competitors do
    json.array!(@competitors) do |competitor|
      json.extract! competitor, :id, :name, :email, :total_distance
      json.avatar do
        json.medium_url competitor.avatar.url(:medium)
        json.square_url competitor.avatar.url(:square)
      end
    end
  end

  json.health do
    json.current_meal do
      json.partial! 'api/v1/shared/meal', meal: @current_meal
    end

    json.current_hydratation do
      json.partial! 'api/v1/shared/hydratation', hydratation: @current_hydratation
    end
  end
end
