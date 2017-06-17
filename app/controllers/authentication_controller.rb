class AuthenticationController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  skip_before_action :require_user

  def signin
    auth = authenticate_with_http_basic do |email, password|
      if user = User.where("lower(email) = lower(?)", email).first
        Authentication.new(user: user).get_auth_token(password: password)
      end
    end

    if auth
      render json: auth, serializer: AuthSerializer
    else
      render json: { error: 'Invalid credentials' }, status: 401
    end
  end

end
