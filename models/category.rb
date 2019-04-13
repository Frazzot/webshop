class Category
    attr_reader :name

    def initialize(category_hash)
       @id = category_hash['id'] 
       @name = category_hash['name']
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
