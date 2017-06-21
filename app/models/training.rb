class Training < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  has_many :trainings_cards
  has_many :cards, through: :trainings_cards, class_name: Card
  has_many :memorized_cards, through: :trainings_cards, class_name: Card
end
