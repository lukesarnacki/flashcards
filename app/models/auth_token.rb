class AuthToken < ApplicationRecord
  validates :client_id, :token_hash, :expires_at, presence: true
  attr_accessor :token
end
