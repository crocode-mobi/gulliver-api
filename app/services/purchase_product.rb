class PurchaseProduct
  include ActiveModel::Validations

  attr_reader(
    :user,
    :product
  )

  def initialize(params={})
    @product = params.fetch(:product, nil)
    @user    = params.fetch(:user, nil)
  end

  def call
    return Error.new(errors: self.errors) if !self.valid?
    enough_points = @user.points >= @product.points

    if enough_points
      ActiveRecord::Base.transaction do
        purchase_product
      end
      Success.new
    else
      return Error.new(errors: "This user has no enough points to purchase this product")
    end
  end

  private

    def purchase_product
      @user.purchased_products.create! product: @product, points_billed: @product.points
      @user.subtract_points(@product.points)
    end

end
