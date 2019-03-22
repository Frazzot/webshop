require_relative '../database/db'
require_relative '../models/category'
require_relative '../models/user'
require_relative '../models/item'

if ENV['RACK_ENV'] == 'test'
    require_relative '../spec/helper_class'
    Database.db = SQLite3::Database.new ':memory:'
    Database.clear()

    Helper.populate_users
    Helper.populate_categories
    Helper.populate_items
end
