require_relative 'user.rb'

class Cart

    def self.add_to_cart(user_id, item_id)
        cart_amount = Database.execute('SELECT cart_amount FROM carts WHERE user_id = ? AND item_id = ?', [user_id, item_id])
        if cart_amount[0] != nil
            Database.execute('UPDATE carts SET cart_amount = ? WHERE user_id = ? AND item_id = ?', [cart_amount[0][0] + 1, user_id, item_id])
        else
            Database.execute('INSERT INTO carts (user_id, item_id, cart_amount) VALUES (?,?,?)', [user_id, item_id, 1])
        end
    end

    def self.get_cart(user_id)
        Database.execute('SELECT * FROM carts WHERE user_id = ?', [user_id])
    end

    def self.get_items_in_cart(user_id)
        Database.execute('SELECT * FROM items
                JOIN carts ON items.id = carts.item_id
                WHERE carts.user_id = ?', [user_id])
    end

    def self.clear_cart(user_id)
        Database.clear_tables("carts")     
    end

    def self.remove_item(user_id, item_id)
        p user_id, item_id
        cart_amount = Database.execute('SELECT cart_amount FROM carts WHERE user_id = ? AND item_id = ?', [user_id, item_id])
        cart_amount = cart_amount[0][0] - 1
        if cart_amount == 0
            Database.execute('DELETE FROM carts WHERE user_id = ? AND item_id = ?', [user_id, item_id])    
        else
            Database.execute('UPDATE carts SET cart_amount = ? WHERE user_id = ? AND item_id = ?', [cart_amount, user_id, item_id])
        end
    end
    
    def self.sum_cart_value(amount, price)
        sum = 0
        zipped = amount.values.zip(price.values)
        zipped.each do |item|
            sum += item[0] * item[1]
        end
        sum
    end

    def self.create_game_hash(cart_items)
        cart_amount_hash = Hash.new(0)
    
        cart_items.each do |item| 
            cart_amount_hash[item["name"]] = item["cart_amount"]
        end

        cart_amount_hash
    end

    def self.create_price_hash(cart_items)
        price_hash = Hash.new
        
        cart_items.each do |item|
            price_hash[item["name"]] = item["price"]
        end

        price_hash
    end

    def self.extract_game_id(name_hash)
        game_name = name_hash.values[0]
        game_id = Database.execute('SELECT id FROM items WHERE name = ?', [game_name])[0]["id"]
    end

end
