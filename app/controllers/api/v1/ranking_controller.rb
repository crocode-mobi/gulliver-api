class Api::V1::RankingController < ApplicationController
  before_action :authenticate_user!

  def index
    @ranking      = RankUser.new(page: params[:page], filter: params[:filter])
    @ranked_users = @ranking.by_distance
    @total        = User.count
  end

end
