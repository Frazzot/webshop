#used by rackup

#Use bundler to select gems
require 'bundler'

# load all gems in Gemfile
Bundler.require

require_relative 'database/db'
require_relative 'app'
require_relative 'models/user'
require_relative 'models/category.rb'

run App
