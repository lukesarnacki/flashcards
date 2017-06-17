class AuthTokenError < StandardError
end

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include JSONAPI::ActsAsResourceController

  attr_reader :current_user

  before_action :require_user

  def context
    { current_user: current_user }
  end

  private

  def require_user
    authenticate_with_http_token do |token, options|
      @current_user = User.authenticate_with_token(options['email'], token)
    end || render_unauthorized
  end

  def render_unauthorized
    render json: { error: 'Wrong token' }, status: 401
  end
end
