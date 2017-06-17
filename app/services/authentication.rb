class Authentication
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def get_auth_token(password:)
    #raise AuthenticationFailed unless valid_password?(password)
    return false unless valid_password?(password)

    AuthToken.create!(
      token: token,
      user: user,
      expires_at: Time.current
    )
  end

  private

  def valid_password?(password)
    user.authenticate(password)
  end

  def token
    @token ||= SecureRandom.urlsafe_base64(nil, false)
  end

  def client_id
    @generate_client_id ||= SecureRandom.uuid
  end
end
