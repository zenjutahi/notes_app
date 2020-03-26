ENV["RACK_ENV"] = "test"

require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require_relative '../config/environment'
require 'rspec'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'chromedriver-helper'
require 'rack_session_access/capybara'
require 'shoulda-matchers'
require 'factory_bot'
require 'faker'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

FactoryBot.definition_file_paths = %w[./factories
                                      ./test/factories
                                      ./spec/factories]
FactoryBot.find_definitions

ActiveRecord::Base.logger = nil

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
  end
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  DatabaseCleaner.strategy = :truncation
  config.include FactoryBot::Syntax::Methods
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.order = 'default'
end

Capybara.configure do |config|
  config.default_max_wait_time = 10
end

def app
  Rack::Builder.parse_file(
    File.expand_path('../config.ru', __dir__)
  ).first
end

Capybara.app = app
Capybara.server = :webrick

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome
