require_relative 'user.rb'
class Cart

    def self.add_to_cart(user_id, game_id)
        Database.execute('INSERT INTO carts (user_id, item_id) VALUES (?,?)', [user_id, game_id])
    end

    def self.get_cart(user_id)
        Database.execute('SELECT * FROM carts WHERE user_id = ?', [user_id])
    end

    def self.get_items_in_cart(user_id)
        Database.execute('SELECT * FROM items
                JOIN carts ON items.id = carts.item_id
                WHERE carts.user_id = ?', user_id)
    end

    def self.clear_cart(user_id)
        Database.execute('DROP TABLE IF EXISTS carts')
        Database.execute('CREATE TABLE carts (user_id INTEGER NOT NULL, 
                 item_id INTEGER NOT NULL,
                 FOREIGN KEY(user_id) REFERENCES users(id),
                 FOREIGN KEY(item_id) REFERENCES items(id))')
    end
    
    def self.sum_cart_value(amount, price)
        sum = 0
        zipped = amount.values.zip(price.values)
        zipped.each do |item|
            sum += item[0] * item[1]
        end
        sum
    end
end
