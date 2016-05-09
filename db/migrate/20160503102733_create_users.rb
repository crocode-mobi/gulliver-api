class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :name
      t.string  :salt
      t.string  :encrypted_password
      t.date    :birthday
      t.string  :genre
      t.integer :weight
      t.integer :height
      t.string  :location
      t.integer :account_status, default: 0

      t.timestamps null: false
    end
    add_index :users, :email    
  end
end
