require "rails_helper"
require 'database_cleaner'

# require 'capybara/poltergeist'
# Capybara.javascript_driver = :poltergeist

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean_with(:truncation)

RSpec.configure do |config|
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false
  config.include EditorMacros, type: :feature

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
