class User
    attr_reader :id, :username, :phone, :mail, :password

    def initialize(user_hash)
        @id = user_hash['id']
        @username = user_hash['username']
        @phone = user_hash['phone']
        @mail = user_hash['mail']
        @password = user_hash['password']
    end

    def self.null_user
        User.new('id' => nil, 'username' => "")
    end
   
    def self.create_user(username, phone, mail, password)
        Database.execute('INSERT INTO users (username, phone, mail, password) VALUES (?, ?, ?, ?)', 
        [username, phone, mail, password])
    end

    def self.get_user(identifier)
        # Try to convert identifier to a numerical id
        id = identifier.to_i
        # If  this failed it will become 0, therefore it's a username, not an id
        if id == 0
            result = Database.execute('SELECT * FROM users WHERE username = ?', identifier)[0]
            User.new(result)
        else
            User.new(Database.execute('SELECT * FROM users WHERE id = ?', id)[0])
        end
    end
end
