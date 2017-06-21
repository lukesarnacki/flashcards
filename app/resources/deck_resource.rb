class DeckResource < JSONAPI::Resource
  before_update :authorize_user
  before_remove :authorize_user

  has_many :trainings

  attributes :name

  has_one :user
  has_many :cards

  private

  def trainings
    return [] unless authorized?
    @model.trainings
  end

  def authorize_user
    if authorized?
      raise NotAuthorizedError
    end
  end

  def authorized?
    context[:current_user] && @model.user_id != context[:current_user].id
  end
end
