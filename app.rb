require_relative './models/user'
require_relative './models/cart'

class App < Sinatra::Base

    enable :sessions
    
    before do
        if session[:user_id]
            @current_user = User.get_user(session[:user_id])
            #@user_id = 
        else
            @current_user = User.null_user
        end
    end

    get '/' do
        @frontpage_items = Item.get_top_amount_items()
        @frontpage_items.map! do |row|
            Item.new(row)
        end
        slim :index
    end

    get '/account/login' do
        slim :frontPage
    end

    get '/account/category/:category_name' do
        @category_name = Category.get_category(params["category_name"])
        @items = Item.get_item_by_category(@category_name.name)
        @items.map! do |row|
            Item.new(row)
        end
        slim :categories
    end

    post '/account/new' do
        username = params['username']
        phone = params['phone']
        mail = params['mail']
        password = BCrypt::Password.create(params['password'])

        User.create_user(username, phone, mail, password)

        redirect '/'
    end

    post '/account/login' do
        user = User.get_user(params['username'])
        hashed_pwd = BCrypt::Password.new(user.password)
        if hashed_pwd == params['password']
            session[:user_id] = user.id
        end
        redirect back
    end

    get '/account/cart' do
        @cart_items = Cart.get_items_in_cart(@current_user.id)
        @cart_amount_hash = Cart.create_game_hash(@cart_items)
        @price_hash = Cart.create_price_hash(@cart_items)

        @sum = Cart.sum_cart_value(@cart_amount_hash, @price_hash)
        slim :cart
    end 

    post '/account/logout' do
        session.destroy
        redirect '/'
    end

    post '/account/addToCart/:id' do
        game_id = params['id'].to_i
        Cart.add_to_cart(@current_user.id, game_id)
    end

    post '/account/clearCart/' do
        Cart.clear_cart(@current_user.id)
    end

    post '/account/removeItem/:index' do
        name_hash = JSON.parse(request.body.read)
        current_game_id = Cart.extract_game_id(name_hash)
        Cart.remove_item(@current_user.id, current_game_id)
    end
     
end

#TODO
#   Update price in slim file when removing items
#   Add looks empty here text when cart is empty from removing separet items
#   Generate sql code
#   LineItem - not todo
#   Add flash
#   error message at login if password or username is incorrect
#   Move map and hash to a separate function 
