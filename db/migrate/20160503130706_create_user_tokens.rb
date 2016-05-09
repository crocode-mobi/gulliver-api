class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.string :token
      t.integer :user_id
      t.string :push_token
      t.string :ip
      t.string :device

      t.timestamps null: false
    end

    add_index :user_tokens, :token
  end
end
