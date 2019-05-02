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
        execute('CREATE TABLE carts (user_id INTEGER NOT NULL, 
                 item_id INTEGER NOT NULL,
                 FOREIGN KEY(user_id) REFERENCES users(id),
                 FOREIGN KEY(item_id) REFERENCES items(id)
                 cart_amount INTEGER)')


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
        case tables
        when "users"
            execute('DROP TABLE IF EXISTS users')
            execute('CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT,
                     username varchar(100) NOT NULL,
                     phone varchar(20) NOT NULL,
                     mail varchar(100) NOT NULL,
                     password varchar(100) NOT NULL)')

        when "categories"
            execute('DROP TABLES IF EXISTS categories')
            execute('CREATE TABLE categories (id INTEGER PRIMARY KEY AUTOINCREMENT,
                     name varchar(100) NOT NULL)')

        when "items"
           execute('DROP TABLE IF EXISTS items')
           execute('CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT,
	                price INTEGER,
	                amount INTEGER,
	                name varchar (100) NOT NULL,
                	image varchar (200))')

        when "carts"
            execute('DROP TABLE IF EXISTS carts')
            execute('CREATE TABLE carts (user_id INTEGER NOT NULL, 
                     item_id INTEGER NOT NULL,
                     cart_amount INTEGER,
                     FOREIGN KEY(user_id) REFERENCES users(id),
                     FOREIGN KEY(item_id) REFERENCES items(id))')
                    
        
        when "order_lines"
            execute('DROP TABLE IF EXISTS order_lines')
            execute('CREATE TABLE order_lines (amount INTEGER,
                     name varchar(40),
                     price varchar(40))')
        
        when "orders"
            execute('DROP TABLE IF EXISTS orders')
            execute('CREATE TABLE orders (id INTEGER PRIMARY KEY AUTOINCREMENT,
                     date varchar(40))')

        when "category_item_id"
            execute('DROP TABLE IF EXISTS category_item_id')
            execute('CREATE TABLE category_item_id (category_id INTEGER NOT NULL,
                     item_id INTEGER NOT NULL,
                     FOREIGN KEY(category_id) REFERENCES categories(id),
                     FOREIGN KEY(item_id) REFERENCES items(id))')
        
        when "cart_item_id"
            execute('DROP TABLE IF EXISTS cart_item_id')
            execute('CREATE TABLE cart_item_id (cart_id INTEGER NOT NULL,
                     item_id INTEGER NOT NULL,
                     FOREIGN KEY(cart_id) REFERENCES carts(id),
                     FOREIGN KEY(item_id) REFERENCES items(id))')
        end
    end

end
