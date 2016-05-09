class CreateViewedTips < ActiveRecord::Migration
  def change
    create_table :viewed_tips do |t|
      t.integer :user_id
      t.integer :tip_id
      t.boolean :shared, default: false

      t.timestamps null: false
    end

    add_index :viewed_tips, [:user_id, :tip_id], unique: true
  end
end
