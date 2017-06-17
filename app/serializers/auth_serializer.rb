class AuthSerializer < ActiveModel::Serializer
  attributes :token, :expires_at
end
