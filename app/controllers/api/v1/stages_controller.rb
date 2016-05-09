class Api::V1::StagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stage, only: [:show]

  def index
    @stages = Stage.all
  end

  def show
  end

  private

    def set_stage
      @stage = Stage.find(params[:id])
    end

end
