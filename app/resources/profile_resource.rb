class ProfileResource < JSONAPI::Resource
  model_name 'User'

  after_create :send_welcome_email

  attributes :first_name,
             :last_name,
             :full_name,
             :email,
             :screen_name,
             :password,
             :password_confirmation,
             :created_at,
             :updated_at

  has_many :decks

  def full_name
    "#{@model.first_name} #{@model.last_name}"
  end

  def fetchable_fields
    super - [:password, :password_confirmation]
  end

  def self.find_by_key(filter, options = {})
    self.new(options[:context][:current_user], options[:context])
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(@model).deliver_now
  end
end
