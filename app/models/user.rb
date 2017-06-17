class User < ApplicationRecord
  has_secure_password
  has_many :auth_tokens

  def self.authenticate_with_token(email, token)
    user = where("lower(email) = lower(?)", email).first

    if user && user.auth_tokens.where(token: token).exists?
      user
    end
  end
end
