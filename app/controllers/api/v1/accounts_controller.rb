class Api::V1::AccountsController < ApplicationController

  def destroy
    @current_user.inactive!
    head :no_content
  end

end
