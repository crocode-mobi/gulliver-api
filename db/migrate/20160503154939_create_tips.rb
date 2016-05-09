class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string  :title
      t.text    :description
      t.string  :section
      t.integer :points, default: 0

      t.timestamps null: false
    end

    add_index :tips, :section
  end
end
