# == Schema Information
#
# Table name: purchased_products
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  product_id    :integer
#  points_billed :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_purchased_products_on_product_id  (product_id)
#  index_purchased_products_on_user_id     (user_id)
#

class PurchasedProduct < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :product

  # Validations
  validates :user, :product, presence: true
  validates :points_billed, presence: true
end
