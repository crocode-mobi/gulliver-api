class Api::V1::LocationsController < ApplicationController

  def index
    @locations = CountryLocation.new.subregions_array
    render json: { data: @locations }, status: :ok
  end

end
