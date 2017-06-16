class AuthSerializer < ActiveModelSerializers::Model
  attributes :token, :expires_at
end
