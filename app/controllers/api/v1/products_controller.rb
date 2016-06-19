class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :purchase]

  def index
    @products = Product.all
  end

  def show
  end

  def purchase
    buyer = PurchaseProduct.new(user: @current_user, product: @product)
    result = buyer.call

    if result.success?
      @product
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

end
