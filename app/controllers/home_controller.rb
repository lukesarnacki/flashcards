class HomeController < ApplicationController

  skip_before_action :require_user

  def base
    render json: {
      type: 'home_page',
      data: {
        links: {
          decks: decks_rfc6570,
          users: users_rfc6570,
          user: users_rfc6570,
          user_decks: user_decks_rfc6570,
          deck: deck_rfc6570,
          card: card_rfc6570,
          profile: profile_url,
          authenticate: signin_rfc6570,
          register: profiles_rfc6570
        }
      }
    }
  end
end
