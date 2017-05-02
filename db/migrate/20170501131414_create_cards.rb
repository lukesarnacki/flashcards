class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :status
      t.string :front_text
      t.string :front_subtext
      t.string :back_text
      t.string :back_subtext
      t.references :deck, index: true, foreign_key: true

      t.timestamps
    end
  end
end
