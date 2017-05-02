require 'rails_helper'

RSpec.describe 'the API', type: :apivore, order: :defined do
  subject { Apivore::SwaggerChecker.instance_for('/swagger.json') }

  it 'tests all documented routes' do
    #expect(subject).to validate_all_paths
    # TODO
  end
end
