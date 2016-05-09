class RoutingController < ApplicationController
  def index
    render json: { errors: "Yey Forrest! Stop! You are running too fast! We are not implementing that feature yet! Please check the documentation." },
           status:  :not_found
  end
end
