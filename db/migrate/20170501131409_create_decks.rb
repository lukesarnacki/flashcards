class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :front_language
      t.string :back_language
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
