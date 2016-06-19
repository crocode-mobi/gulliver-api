class CreatePurchasedProducts < ActiveRecord::Migration
  def change
    create_table :purchased_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :points_billed

      t.timestamps null: false
    end

    add_index :purchased_products, :user_id
    add_index :purchased_products, :product_id
  end
end
