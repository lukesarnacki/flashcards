class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings, id: :uuid do |t|
      t.references :user, foreign_key: true, index: true, type: :uuid
      t.references :deck, foreign_key: true, index: true, type: :uuid
      t.timestamp :started_at
      t.timestamp :ended_at

      t.timestamps
    end
  end
end
