class UserResource < JSONAPI::Resource
  attributes :screen_name, :created_at, :updated_at
  has_many :decks
end
