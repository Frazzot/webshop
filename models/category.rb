class Category
    attr_reader :name

    def initialize(user_hash)
       @id = user_hash['id'] 
       @name = user_hash['name']
    end
end
