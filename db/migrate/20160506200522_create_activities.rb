class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :steps,    default: 0
      t.float   :distance, default: 0
      t.float   :kcal,     default: 0
      t.date    :done_at
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :activities, [:done_at, :user_id], unique: true
  end
end
