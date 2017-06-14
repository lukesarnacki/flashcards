class ProfileResource < JSONAPI::Resource
  model_name 'User'
  attributes :name, :email, :screen_name, :created_at, :updated_at

  # def self.find_by_key(filter, options = {})
  #   self.new(options[:context][:current_user], options[:context])
  # end
end
