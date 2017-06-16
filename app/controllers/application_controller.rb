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
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.authenticate_with_token(options['email'], token)
    end
  end
end
