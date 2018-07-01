ENV["RACK_ENV"] = 'test'
require 'bundler'
Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)
require 'capybara/dsl'

DatabaseCleaner.strategy = :truncation
Capybara.app = SetList
Capybara.save_path = 'tmp/capybara'

RSpec.configure do |configuration|
  configuration.before(:all) do
    DatabaseCleaner.clean
  end

  configuration.after(:each) do
    DatabaseCleaner.clean
  end

 configuration.include Capybara::DSL
end