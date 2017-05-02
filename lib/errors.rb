# This file lists all of the custom errors

class AuthenticationFailed < StandardError
  def message
    'Authentication failed, given credentials are invalid'
  end
end
