class CreateAuthTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tokens do |t|
      t.references :user, index: true, foreign_key: true
      t.uuid :client_id, index: true, null: false
      t.string :token_hash, null: false
      t.timestamp :expires_at, null: false
      t.timestamps null: false
    end
  end
end
