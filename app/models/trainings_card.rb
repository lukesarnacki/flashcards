class TrainingsCard < ApplicationRecord
  belongs_to :card
  belongs_to :memorized_card, class_name: Card, foreign_key: :card_id
  belongs_to :training
end
