require 'rspec'
require 'database_cleaner'
require "rspec/core"
require "spinach-rails"

require "capybara/dsl"
require "spinach/capybara"

require "site_prism"
DatabaseCleaner.strategy = :truncation

Spinach.hooks.after_scenario do
  DatabaseCleaner.clean
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu window-size=1200,800])
end
Capybara.default_driver = :chrome
Capybara.default_selector = :css
