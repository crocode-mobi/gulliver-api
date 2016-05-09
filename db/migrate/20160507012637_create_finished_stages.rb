class CreateFinishedStages < ActiveRecord::Migration
  def change
    create_table :finished_stages do |t|
      t.integer :user_id
      t.integer :stage_id

      t.timestamps null: false
    end
    add_index :finished_stages, [:user_id, :stage_id], unique: true
  end
end
