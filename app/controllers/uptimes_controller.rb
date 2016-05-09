class UptimesController < ApplicationController

  def index
    render json: { status: "This amazing API is spinning around the world! Run Forrest Run!" }, status: 200
  end

end
