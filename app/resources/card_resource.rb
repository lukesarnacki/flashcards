class CardResource < JSONAPI::Resource
  attributes :front_text, :back_text, :front_subtext, :back_subtext
end
