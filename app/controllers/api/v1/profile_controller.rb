class Api::V1::ProfileController < ApplicationController
  before_action :authenticate_user!

  def me
    @total_stages = Stage.count
    @stages = @current_user.stages
    @badges = @current_user.badges
  end

  def show
  end

  def update
    if @current_user.update(profile_params)
      @current_user
    else
      render json: { errors: @current_user.errors }, status: :unprocessable_entity
    end
  end

  private

    def profile_params
      params.require(:user).permit(:name, :birthday, :genre,
                                  :weight, :height, :location)
    end


end
