class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :status
      t.string :front_text, null: false
      t.string :front_subtext
      t.string :back_text, null: false
      t.string :back_subtext
      t.references :deck, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
