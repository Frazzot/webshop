class Category
    attr_reader :name

    def initialize(user_hash)
       @id = user_hash['id'] 
       @name = user_hash['name']
    end
    
    def self.get_category(identifier)
        id = identifier.to_i
        if id == 0
            result = Database.execute('SELECT * FROM categories WHERE name = ?', identifier)[0]
            Category.new(result)
        else
            result = Database.execute('SELECT * FROM categories WHERE id = ?', id[0])
            Category.new(result)
        end
    end
end
