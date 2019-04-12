require_relative '../database/db' 
require_relative '../models/user'

class Helper

    def self.rspec_user
        @rspec_user = 'rspec_user'
    end

    def self.rspec_mail
        @rspec_mail = 'rspec_mail@mail.com'
    end

    def self.rspec_pass
        @rspec_pass = 'rspec_pass'
    end

    def self.rspec_phone
        @rspec_phone = 'rspec_phone'
    end
    
    def self.populate_users
       User.create_user('rspec_user_1', '10000', 'rspec_mail_1@mail.com', BCrypt::Password.create('rspec_pass_1'))
       User.create_user('rspec_user_2', '20000', 'rspec_mail_2@mail.com', BCrypt::Password.create('rspec_pass_2'))
       User.create_user('rspec_user_3', '30000', 'rspec_mail_3@mail.com', BCrypt::Password.create('rspec_pass_3'))
       User.create_user('rspec_user_4', '40000', 'rspec_mail_4@mail.com', BCrypt::Password.create('rspec_pass_4'))
       User.create_user('rspec_user_5', '50000', 'rspec_mail_5@mail.com', BCrypt::Password.create('rspec_pass_5'))
       User.create_user('rspec_user_6', '60000', 'rspec_mail_6@mail.com', BCrypt::Password.create('rspec_pass_6'))
       User.create_user('rspec_user_7', '70000', 'rspec_mail_7@mail.com', BCrypt::Password.create('rspec_pass_7'))
    end
    
    def self.populate_categories
        Database.execute("INSERT INTO `categories` (id,name) VALUES (1,'action')")
        Database.execute("INSERT INTO `categories` (id,name) VALUES (2,'puzzle')")
        Database.execute("INSERT INTO `categories` (id,name) VALUES (3,'adventure')")
    end
    
    # Must be called after categories exist
    def self.populate_items
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (0,NULL,NULL,'',NULL)")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (2,299,3,'Mad Max','game2.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (3,99,6,'Recore','game3.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (4,399,4,'Assassin''s Creed Origins','game6.jpeg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (5,349,7,'Quantum Break','game7.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (6,249,10,'Mortal Kombat X','game8.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (7,99,5,'Undertale','game9.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (8,499,6,'Final Fantasy XV','game10.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (9,199,3,'Forza Horizon 3','game11.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (10,149,5,'Kinect Sports Rivals','game12.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (11,199,15,'Minecraft','game13.jpg')")
        Database.execute("INSERT INTO `items` (id,price,amount,name,image) VALUES (12,499,8,'Shadow Of The Tomb Raider','game14.jpg')")

        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,1)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,2)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,2)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,3)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,4)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,4)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (2,5)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,5)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,6)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (2,7)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,7)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,8)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,8)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,9)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,10)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,11)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,12)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (2,12)")    
        Database.execute("INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,12)")    
    end
end
