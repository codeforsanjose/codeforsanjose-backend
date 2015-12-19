ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'simplecov'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start
SimpleCov.start 'rails'

class ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
