class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.integer :points

      t.timestamps null: false
    end
  end
end
