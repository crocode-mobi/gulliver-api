class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :cereal
      t.integer :fruit
      t.integer :vegetable
      t.integer :meat
      t.integer :dairy
      t.integer :sweets
      t.integer :fats
      t.date    :consumed_at
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :meals, [:user_id, :consumed_at], unique: true
  end
end
