class CreateTrainingsCards < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings_cards, id: :uuid do |t|
      t.references :card, foreign_key: true, index: true, type: :uuid
      t.references :training, foreign_key: true, index: true, type: :uuid
      t.boolean :attempted, null: false, default: false
      t.boolean :memorizeed, null: false, default: false

      t.timestamps
    end
  end
end
