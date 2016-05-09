class Api::V1::BadgesController < ApplicationController

  def index
    @badges = Merit::Badge.find_all.to_a
  end

  def show
    id = params[:id].to_i if params[:id].present?
    @badge = Merit::Badge.find(id)
  end

end
