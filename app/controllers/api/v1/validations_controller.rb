class Api::V1::ValidationsController < ApplicationController

  def index
    if params[:email].present?
      @user = User.find_by(email: params[:email].downcase)
      @available = @user ? false : true
      render json: { available: @available }, status: :ok
    else
      render json: { errors: "Email should be present to apply validations"}
    end
  end

end
