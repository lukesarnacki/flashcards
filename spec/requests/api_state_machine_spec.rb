require 'rails_helper'

describe 'api as state machine', type: :request do
  let!(:user) { create :user }
  let!(:deck) { create :deck, user: user }
  let!(:sign_in_headers) do
    { 'Authorization' => "Basic #{Base64.encode64('john@example.com:secret')}" }
  end

  it 'allows to create a deck' do
    get '/'

    home_body = JSON.parse(response.body)

    authentication_url = home_body['data']['links']['authenticate']
    post authentication_url, params: {}, headers: sign_in_headers

    auth_body = JSON.parse(response.body)
    token = auth_body['data']['attributes']['token']

    headers_with_authorization = {
      Authorization: "Token token=#{token}; email=john@example.com",
      Accept: "application/vnd.api+json",
      "Content-Type": "application/vnd.api+json"
    }

    decks_url = home_body['data']['links']['decks']
    get decks_url, params: {}, headers: headers_with_authorization

    decks_body = JSON.parse(response.body)
    deck = decks_body['data'][0]
    deck_id = deck['id']

    create_card_json = {
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
    }.to_json

    cards_url = deck['relationships']['cards']['links']['related']
    post cards_url, params: create_card_json, headers: headers_with_authorization

    create_card_body = JSON.parse(response.body)
    card_id = create_card_body['data']['id']

    expect { Card.find(card_id) }.to_not raise_error
  end
end
