class ApplicationController < ActionController::API
  before_filter :authenticate

  private

  def authenticate
    true # TODO
  end
end
