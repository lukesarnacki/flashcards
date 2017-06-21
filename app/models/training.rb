class Training < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  has_many :trainings_cards
end
