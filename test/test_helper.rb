ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'minitest/reporters'
require 'vcr'
require 'webmock/minitest'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new]

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase


  # Set UP VCR
  VCR.configure do |config|
    # Set Folder Where store Cassettes
    config.cassette_library_dir = "test/cassettes"
    # Tell VCR to use Webmock
    config.hook_into :webmock
    config.default_cassette_options = {
      # If we don't have a casset for this
      #  Record a new one
      record: :new_episodes,
      # It determines which cassette to use
      # Based on: HTTP Verb
      #           uri
      #           Body of the message
      match_requests_on: [:method, :uri, :body]
    }
    # Hide the Slack Token
    config.filter_sensitive_data("<SLACK_TOKEN>") do
      ENV["SLACK_TOKEN"]
    end
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...







end
