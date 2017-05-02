require 'rails_helper'

describe Authentication do
  let(:user) { double(:user, authenticate: valid_password) }
  subject { Authentication.new(user: user).get_access_token(password: 'secret') }

  context 'when password is valid' do
    let(:valid_password) { true }

    before do
      allow(SecureRandom).to receive(:urlsafe_base64).and_return('random_token')
      allow(BCrypt::Password).to receive(:create).with('random_token').and_return('random_token_hash')
      allow(SecureRandom).to receive(:uuid).and_return('11111111-1111-4111-8111-111111111111')
    end

    it 'creates access token' do
      expect(subject).to be_persisted
      expect(subject.client_id).to eql('11111111-1111-4111-8111-111111111111')
      expect(subject.token).to eql('random_token')
      expect(subject.token_hash).to eql('random_token_hash')
    end
  end

  context 'when password is invalid' do
    let(:valid_password) { false }

    it 'raises AuthenticationFailed' do
      expect { subject }.to raise_error AuthenticationFailed, 'Authentication failed, given credentials are invalid'
    end
  end
end
