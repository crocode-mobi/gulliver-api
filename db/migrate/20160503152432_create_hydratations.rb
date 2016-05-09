class CreateHydratations < ActiveRecord::Migration
  def change
    create_table :hydratations do |t|
      t.float :quantity
      t.integer :user_id
      t.date :consumed_at

      t.timestamps null: false
    end
    add_index :hydratations, [:user_id, :consumed_at], unique: true
  end
end
