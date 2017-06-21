class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include JSONAPI::ActsAsResourceController

  before_action :require_user
  before_action :add_profile_url

  attr_reader :current_user

  rescue_from NotAuthorizedError do |e|
    render json: { error: 'Access Denied' }, status: 403
  end

  def context
    { current_user: current_user }
  end

  private

  def add_profile_url
    response.headers['Link'] = "<#{request.protocol + request.host_with_port}/profile.xml>; rel=\"profile\""
  end

  def require_user
    @current_user = authenticate_with_http_token do |token, options|
      User.authenticate_with_token(options['email'], token)
    end

    @current_user || render_unauthorized
  end

  def render_unauthorized
    render json: { error: 'Wrong token' }, status: 401
  end
end
