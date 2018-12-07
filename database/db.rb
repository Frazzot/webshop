class Database

    @@db ||= SQLite3::Database.new("database/user_data.db")
    @@db.results_as_hash = true

    def self.execute(*args)
        @@db.execute(*args)
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
        execute('CREATE TABLE items (category_id INTEGER,
                 price INTEGER,
                 amount INTEGER)')

        execute('DROP TABLE IF EXISTS carts')
        execute('CREATE TABLE carts (id INTEGER PRIMARY KEY AUTOINCREMENT)')

        execute('DROP TABLE IF EXISTS order_lines')
        execute('CREATE TABLE order_lines (amount INTEGER
                 name varchar(40),
                 price varchar(40))')

        execute('DROP TABLE IF EXISTS orders')
        execute('CREATE TABLE orders (id INTEGER PRIMARY KEY AUTOINCREMENT,
                 date varchar(40))')
    end

    def self.create_user(username, phone, mail, password)
        execute('INSERT INTO users (username, phone, mail, password) VALUES (?, ?, ?, ?)', 
        [username, phone, mail, password])
    end

    def self.get_user(arg)
        argument = arg.to_i
        if argument == 0
            result = execute('SELECT * FROM users')
            User.new(result[0])
        else
            User.new(execute('SELECT * FROM users WHERE id = ?', argument)[0])
        end
    end

end