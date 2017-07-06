class DecksController < ApplicationController
  include JSONAPI::ActsAsResourceController

  skip_before_action :require_user,
                     only: [
                       :index,
                       :show,
                       :show_relationship,
                       :get_related_resource,
                       :get_related_resources
                     ]
end
