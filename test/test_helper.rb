ENV["RAILS_ENV"] = "test"
require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  require 'factory_girl'
  include FactoryGirl::Syntax::Methods
  FactoryGirl.reload
end
