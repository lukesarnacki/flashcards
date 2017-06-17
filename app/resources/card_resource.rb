class CardResource < JSONAPI::Resource
  attributes :front_text,
             :back_text,
             :front_subtext,
             :back_subtext,
             :created_at,
             :updated_at

  has_one :user
  has_one :deck

  def self.updatable_fields(*)
    super - [:created_at, :updated_at]
  end

  def self.creatable_fields(*)
    super - [:created_at, :updated_at]
  end
end
