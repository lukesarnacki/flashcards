require 'rails_helper'

Rspec.describe 'api as state machine', type: :request do
  let(:user) { create :user }
  let(:deck) { create :deck, user: user }
  let(:card_1) { create :card, deck: deck }
  let(:card_2) { create :card, deck: deck }

  it 'renders base URL' do

  end
end
