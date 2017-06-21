class ProfilesController < ApplicationController
  skip_before_action :require_user, only: [:create]
end
