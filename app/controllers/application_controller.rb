class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController

  before_filter :authenticate

  def context
    { current_user: current_user }
  end

  private

  def authenticate
    true # TODO
  end

  def current_user
    User.first
  end
end
