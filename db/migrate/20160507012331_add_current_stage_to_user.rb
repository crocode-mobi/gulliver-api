class AddCurrentStageToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_stage_id, :integer
  end
end
