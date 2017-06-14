class DeckResource < JSONAPI::Resource
  attributes :name, :front_language, :back_language

   belongs_to :user
   has_many :cards
end
