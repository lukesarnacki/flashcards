class User < ApplicationRecord
  has_secure_password

  has_many :auth_tokens
  has_many :decks

  validates :first_name, :last_name, :email, :screen_name, presence: true
  validates :email, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :screen_name, :email, uniqueness: true

  scope :with_email, -> (email) { where("lower(email) = lower(?)", email) }

  def self.authenticate_with_token(email, token)
    user = with_email(email).first

    if user && user.auth_tokens.where(token: token).exists?
      user
    end
  end
end
