class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def show
    @total_stages = Stage.count
    @stages = @user.stages
    @badges = @user.badges
  end

  def hydratations
  end

  def meals
  end

  def badges
    @badges = @user.badges
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
