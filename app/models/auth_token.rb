class AuthToken < ApplicationRecord
  validates :user_id, :token, :expires_at, presence: true
  belongs_to :user
end
