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
    creatable_or_updatable_fields
  end

  def self.creatable_fields(*)
    creatable_or_updatable_fields
  end

  private

  def creatable_or_updatable_fields
    super - [:created_at, :updated_at]
  end
end
