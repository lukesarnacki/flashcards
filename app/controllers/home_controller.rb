class HomeController < ApplicationController

  skip_before_action :require_user

  def base
    render json: {
      type: 'home_page',
      data: {
        links: {
          decks: decks_url,
          users: users_url,
          user: users_rfc6570,
          deck: deck_rfc6570,
          card: card_rfc6570,
          profile: profile_url
        }
      }
    }
  end
end
