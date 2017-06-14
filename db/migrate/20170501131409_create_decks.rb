class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks, id: :uuid do |t|
      t.string :name, null: false
      t.string :front_language, null: false
      t.string :back_language, null: false
      t.references :user, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
