ENV['RAILS_ENV'] ||= 'test'

require_relative 'dummy/config/environment'
require 'rspec/rails'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
