class TrainingResource < JSONAPI::Resource
  attributes :started_at, :ended_at, :score

  has_one :user
  has_one :deck

  has_many :cards
  has_many :memorized_cards

  def score
    (memorized_cards.count / cards.count).round
  end
end
