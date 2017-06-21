class TrainingResource < JSONAPI::Resource
  attributes :started_at, :ended_at, :score

  has_one :user
  has_one :deck

  has_many :cards
  has_many :memorized_cards

  def score
    return 0 if cards.count == 0
    (memorized_cards.count / cards.count).round
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].trainings
  end
end
