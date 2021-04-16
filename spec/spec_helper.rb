require_relative '../app'

ENV['APP_ENV'] = 'test'

require 'app'
require 'rspec'
require 'rack/test'

require 'pry'
require 'securerandom'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.disable_monkey_patching!
  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  Kernel.srand config.seed

  config.include Rack::Test::Methods
end
