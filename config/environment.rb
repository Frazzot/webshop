require_relative '../database/db'
require_relative '../models/category'
require_relative '../models/user'
require_relative '../models/item'

if ENV['RACK_ENV'] == 'test'
    Database.db = SQLite3::Database.new ':memory:'
    Database.clear()
end
