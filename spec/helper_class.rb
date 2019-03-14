require_relative '../database/db' 

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
        Database.create_user('rspec_user_1', '10000', 'rspec_mail_1@mail.com', BCrypt::Password.create('rspec_pass_1'))
        Database.create_user('rspec_user_2', '20000', 'rspec_mail_2@mail.com', Bcrypt::Password.create('rspec_pass_2'))
        Database.create_user('rspec_user_3', '30000', 'rspec_mail_3@mail.com', BCrypt::Password.create('rspec_pass_3'))
        Database.create_user('rspec_user_4', '40000', 'rspec_mail_4@mail.com', BCrypt::Password.create('rspec_pass_4'))
        Database.create_user('rspec_user_5', '50000', 'rspec_mail_5@mail.com', BCrypt::Password.create('rspec_pass_5'))
        Database.create_user('rspec_user_6', '60000', 'rspec_mail_6@mail.com', BCrypt::Password.create('rspec_pass_6'))
        Database.create_user('rspec_user_7', '70000', 'rspec_mail_7@mail.com', BCrypt::Password.create('rspec_pass_7'))
    end
end
