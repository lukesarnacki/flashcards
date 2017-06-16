class AuthenticationController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  skip_before_action :require_user

  def signin
    auth = authenticate_or_request_with_http_basic do |email, password|
      user = User.where("lower(email) = lower(?)", email).first!
      Authentication.new(user: user).get_auth_token(password: password)
    end

    render json: auth, serializer: AuthSerializer

  rescue ActiveRecord::RecordNotFound
    render json: 'Invalid credentials', status: 401
  end

end
