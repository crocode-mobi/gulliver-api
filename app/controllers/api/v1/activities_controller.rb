class Api::V1::ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def create
    activityGenerator = GenerateActivity.new(user: @current_user, activities: activities_params)
    result = activityGenerator.call

    if result.success?
      @activities = activityGenerator.activities
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  private

    def activities_params
      params.require(:activities)
    end

end
