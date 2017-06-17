require 'rails_helper'

describe 'api as state machine', type: :request do
  let!(:user) { create :user }
  let!(:deck) { create :deck, user: user }

  it 'allows to create a deck' do
    get '/'

    home_body = JSON.parse(response.body)

    signin_headers = { 'Authorization' => "Basic #{Base64.encode64('john@example.com:secret')}" }
    post home_body['data']['links']['authenticate'], params: {}, headers: signin_headers

    auth_body = JSON.parse(response.body)
    token = auth_body['data']['attributes']['token']

    get home_body['data']['links']['decks'], params: {}, headers: { Authorization: "Token token=#{token}; email=john@example.com", Accept: "application/vnd.api+json" }

    decks_body = JSON.parse(response.body)
    deck = decks_body['data'][0]
    deck_id = deck['id']

    create_card_params = {
      "data": {
        "type": "cards",
        "attributes": {
         "front_text": "koń",
         "back_text": "das Pferd"
        },
        "relationships": {
          "deck": {
            "data": {
              "id": deck_id,
              "type": "decks"
             }
          }
        }
      }
    }
    post deck['relationships']['cards']['links']['related'], params: create_card_params.to_json, headers: { Authorization: "Token token=#{token}; email=john@example.com", Accept: "application/vnd.api+json", "Content-Type": "application/vnd.api+json" }

    create_card_body = JSON.parse(response.body)
    card_id = create_card_body['data']['id']

    expect { Card.find(card_id) }.to_not raise_error
  end
end
