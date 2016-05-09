class AddTotalStepsAndTotalDistanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_steps,      :integer, default: 0
    add_column :users, :total_distance,   :float, default: 0.0
    add_column :users, :total_kcal,       :float, default: 0.0
    add_column :users, :last_activity_at, :date
  end
end
