class Api::V1::RacesController < ApplicationController
  before_action :authenticate_user!

  def start
    if !@current_user.started_at
      @current_user.update(started_at: Time.zone.today, current_stage: Stage.find_by(position: 1))
      head :no_content
    else
      render json: { errors: "Forrest is already on the way! You cant get back to the start"}
    end
  end

  def status
    race_status = RaceStatus.new(
      current_user: @current_user,
      date_at: Time.zone.today,
      from: params[:from],
      to: params[:to],
      size: params[:size]
    )
    race_status.call

    @total_stages  = Stage.count
    @current_stage = @current_user.current_stage
    @current_meal  = race_status.current_meal
    @current_hydratation = race_status.current_hydratation
    @competitors = race_status.competitors
  end

end
