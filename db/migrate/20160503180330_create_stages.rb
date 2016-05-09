class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :position
      t.string :from
      t.string :to
      t.float :distance

      t.timestamps null: false
    end
    add_index :stages, :position
  end
end
