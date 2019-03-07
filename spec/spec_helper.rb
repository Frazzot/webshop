ENV['RACK_ENV'] = 'test'

require 'bundler'

Bundler.require

require_relative '../config/environment'
require_relative '../app'
require 'capybara/rspec'

Capybara.app = App
Capybara.server = :webrick

Capybara.default_driver = :selenium_chrome
