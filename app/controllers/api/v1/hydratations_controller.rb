class Api::V1::HydratationsController < ApplicationController
  before_action :authenticate_user!

  # Get current_user (me) hydratations
  def index
    @today_hydratations = @current_user.hydratations.for_today
    @today_hydratations = @current_user.hydratate(0) if @today_hydratations.nil?
    @until_today_hydratations  = @current_user.hydratations.until_today.limit(5)
  end

  # Create hydratation for the current user (me)
  def create
    @hydratation = @current_user.hydratate(params[:hydratation][:quantity])

    if @hydratation.valid?
      @hydratation
    else
      render json: { errors: @hydratation.errors }, status: :unprocessable_entity
    end
  end

end
