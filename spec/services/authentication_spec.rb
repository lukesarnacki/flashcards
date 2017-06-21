require 'rails_helper'

describe Authentication do
  let(:user) { double(:user, authenticate: valid_password) }
  let(:auth_token) { AuthToken.create(user: create(:user), expires_at: 1.month.from_now, token: 'random_token') }
  subject { Authentication.new(user: user).get_auth_token(password: 'secret') }

  context 'when password is valid' do
    let(:valid_password) { true }

    before do
      allow(AuthToken).to receive(:create!).and_return(auth_token)
      allow(SecureRandom).to receive(:uuid).and_return('11111111-1111-4111-8111-111111111111')
    end

    it 'creates access token' do
      expect(subject).to be_persisted
      expect(subject.token).to eql('random_token')
    end
  end

  context 'when password is invalid' do
    let(:valid_password) { false }

    it 'raises AuthenticationFailed' do
      expect( subject ).to be_falsy
    end
  end
end
