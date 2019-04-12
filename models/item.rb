class Item

    attr_reader :id, :price, :amount, :name, :image

    def initialize(item_hash)
        @id = item_hash['id']
        @price = item_hash['price']
        @amount = item_hash['amount']
        @name = item_hash['name']
        @image = item_hash['image']
    end

    def self.get_item(identifier)
        id = identifier.to_i
        if id == 0
            result = Database.execute('SELECT * FROM items WHERE id = ?', identifier)[0]
            Items.new(result)
        else
            result = Database.execute('SELECT * FROM items WHERE id = ?', id[0])
            Items.new(result)
        end
    end

    def self.get_item_by_category(category)
        # check every item in item table to sort in the correct category
        if category == "action"
            category1 = Database.execute('SELECT * FROM items
                                JOIN category_item_id ON items.id = category_item_id.item_id
                                WHERE category_item_id.category_id = 1') 
        elsif category == "puzzle"
            category2 = Database.execute('SELECT * FROM items
                                JOIN category_item_id ON items.id = category_item_id.item_id
                                WHERE category_item_id.category_id = 2')
        elsif category == "adventure"
            category3 = Database.execute('SELECT * FROM items
                                JOIN category_item_id ON items.id = category_item_id.item_id
                                WHERE category_item_id.category_id = 3')
        end
    end

    def self.get_top_amount_items()
        Database.execute('SELECT * FROM items ORDER BY amount DESC LIMIT 3')
    end
    
    def self.add_to_cart(user_id, game_id)
        Database.execute('INSERT INTO carts (user_id, item_id) VALUES (?,?)', [user_id, game_id])
    end
end
