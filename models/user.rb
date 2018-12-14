class User
    attr_reader :id, :username, :phone, :mail, :password

    def initialize(user_hash)
        p user_hash
        @id = user_hash['id']
        @username = user_hash['username']
        @phone = user_hash['phone']
        @mail = user_hash['mail']
        @password = user_hash['password']
    end

    def self.null_user
        User.new('id' => nil, 'username' => "")
    end
   
    #def self.get(hash) 
    #    if hash.keys.first == :id
    #        result = db.execute("SELECT * FROM users WHERE id = ?", hash[:id])
    #    else
    #    
    #    end
    #    self.new(result)
    #end  

end