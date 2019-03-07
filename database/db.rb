class Database

    @@db ||= SQLite3::Database.new("database/user_data.db")
    @@db.results_as_hash = true

    def self.execute(*args)
        @@db.execute(*args)
    end

    def self.db=(database)
        @@db = database
        @@db.results_as_hash = true
    end

    def self.clear()

        execute('DROP TABLE IF EXISTS users')
        execute('CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT,
                 username varchar(100) NOT NULL,
                 phone varchar(20) NOT NULL,
                 mail varchar(100) NOT NULL,
                 password varchar(100) NOT NULL)')

        execute('DROP TABLE IF EXISTS categories')
        execute('CREATE TABLE categories (id INTEGER PRIMARY KEY AUTOINCREMENT,
                 name varchar(100) NOT NULL)')

        execute('DROP TABLE IF EXISTS items')
        execute('CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT,
                 price INTEGER,
                 amount INTEGER,
                 name varchar(100) NOT NULL,
                 image varchar(200))')

        execute('DROP TABLE IF EXISTS carts')
        execute('CREATE TABLE carts (id INTEGER PRIMARY KEY AUTOINCREMENT)')

        execute('DROP TABLE IF EXISTS order_lines')
        execute('CREATE TABLE order_lines (amount INTEGER,
                 name varchar(40),
                 price varchar(40))')

        execute('DROP TABLE IF EXISTS orders')
        execute('CREATE TABLE orders (id INTEGER PRIMARY KEY AUTOINCREMENT,
                 date varchar(40))')

        execute('DROP TABLE IF EXISTS category_item_id')
        execute('CREATE TABLE category_item_id (category_id INTEGER NOT NULL,
                 item_id INTEGER NOT NULL,
                 FOREIGN KEY(category_id) REFERENCES categories(id),
                 FOREIGN KEY(item_id) REFERENCES items(id))')

        execute('DROP TABLE IF EXISTS cart_item_id')
        execute('CREATE TABLE cart_item_id (cart_id INTEGER NOT NULL,
                 item_id INTEGER NOT NULL,
                 FOREIGN KEY(cart_id) REFERENCES carts(id),
                 FOREIGN KEY(item_id) REFERENCES items(id))')
    end

    def self.clear_tables(tables)
        if tables == "users"
            execute('DROP TABLE IF EXISTS users')
            execute('CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT,
                     username varchar(100) NOT NULL,
                     phone varchar(20) NOT NULL,
                     mail varchar(100) NOT NULL,
                     password varchar(100) NOT NULL)')

        elsif tables == "categories"
            execute('DROP TABLES IF EXISTS categories')
            execute('CREATE TABLE categories (id INTEGER PRIMARY KEY AUTOINCREMENT,
                     name varchar(100) NOT NULL)')
        elsif tables == "items"
           execute('DROP TABLE IF EXISTS items')
           execute('CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT,
	                price INTEGER,
	                amount INTEGER,
	                name varchar (100) NOT NULL,
                	image varchar (200))')

        elsif tables == "carts"
            execute('DROP TABLE IF EXISTS carts')
            execute('CREATE TABLE carts (id INTEGER PRIMARY KEY AUTOINCREMENT)')

        elsif tables == "order_lines"
            execute('DROP TABLE IF EXISTS order_lines')
            execute('CREATE TABLE order_lines (amount INTEGER,
                     name varchar(40),
                     price varchar(40))')
        
        elsif tables == "orders"
            execute('DROP TABLE IF EXISTS orders')
            execute('CREATE TABLE orders (id INTEGER PRIMARY KEY AUTOINCREMENT,
                     date varchar(40))')

        elsif tables == "category_item_id"
            execute('DROP TABLE IF EXISTS category_item_id')
            execute('CREATE TABLE category_item_id (category_id INTEGER NOT NULL,
                     item_id INTEGER NOT NULL,
                     FOREIGN KEY(category_id) REFERENCES categories(id),
                     FOREIGN KEY(item_id) REFERENCES items(id))')
        
        elsif tables == "cart_item_id"
            execute('DROP TABLE IF EXISTS cart_item_id')
            execute('CREATE TABLE cart_item_id (cart_id INTEGER NOT NULL,
                     item_id INTEGER NOT NULL,
                     FOREIGN KEY(cart_id) REFERENCES carts(id),
                     FOREIGN KEY(item_id) REFERENCES items(id))')
        end
    end

    def self.create_user(username, phone, mail, password)
        execute('INSERT INTO users (username, phone, mail, password) VALUES (?, ?, ?, ?)', 
        [username, phone, mail, password])
    end

    def self.get_user(identifier)
        # Try to convert identifier to a numerical id
        id = identifier.to_i
        # If  this failed it will become 0, therefore it's a username, not an id
        if id == 0
            result = execute('SELECT * FROM users WHERE username = ?', identifier)[0]
            User.new(result)
        else
            User.new(execute('SELECT * FROM users WHERE id = ?', id)[0])
        end
    end

    def self.get_category(identifier)
        id = identifier.to_i
        if id == 0
            result = execute('SELECT * FROM categories WHERE name = ?', identifier)[0]
            Category.new(result)
        else
            result = execute('SELECT * FROM categories WHERE id = ?', id[0])
            Category.new(result)
        end
    end
    
    def self.get_item(identifier)
        id = identifier.to_i
        if id == 0
            result = execute('SELECT * FROM items WHERE id = ?', identifier)[0]
            Items.new(result)
        else
            result = execute('SELECT * FROM items WHERE id = ?', id[0])
            Items.new(result)
        end
    end
    
    def self.get_item_by_category(category)
        # check every item in item table to sort in the correct category
        if category == "action"
            category1 = execute('select * from items
                                join category_item_id on items.id = category_item_id.item_id
                                where category_item_id.category_id = 1') 
        elsif category == "puzzle"
            category2 = execute('select * from items
                                join category_item_id on items.id = category_item_id.item_id
                                where category_item_id.category_id = 2')
        elsif category == "adventure"
            catecory3 = execute('select * from items
                                join category_item_id on items.id = category_item_id.item_id
                                where category_item_id.category_id = 3')
        end
    end
    
    def self.get_top_amount_items()
        execute('SELECT * FROM items ORDER BY amount DESC LIMIT 3')
    end
end
