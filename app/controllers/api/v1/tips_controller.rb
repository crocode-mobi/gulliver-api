class Api::V1::TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tip, only: [:share]

  def index
    @tips = Tip.all.page(params[:page])
  end

  def hydratation
    @tips = Tip.hydratation.page(params[:page])
  end

  def meal
    @tips = Tip.meal.page(params[:page])
  end

  def running
    @tips = Tip.running.page(params[:page])
  end

  def other
    @tips = Tip.other.page(params[:page])
  end

  def share
    @shared_tip = @current_user.viewed_tips.find_by(tip: @tip)
    @shared_tip.update(shared: true) if @shared_tip
    head :no_content
  end

  private

    def set_tip
      @tip = Tip.find(params[:id])
    end

    def current_user
      @current_user
    end

end
