class Authentication
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def get_auth_token(password:)
    return false unless valid_password?(password)

    AuthToken.create!(
      token: token,
      user: user,
      expires_at: 1.month.from_now
    )
  end

  private

  def valid_password?(password)
    user.authenticate(password)
  end

  def token
    @token ||= SecureRandom.urlsafe_base64(nil, false)
  end
end
