class App < Sinatra::Base

    enable :sessions
    
    before do
        if session[:user_id]
            @current_user = Database.get_user(session[:user_id])
        else
            @current_user = User.null_user
        end
    end

    get '/' do
        @frontpage_items = Database.get_top_amount_items()
        @frontpage_items.map! do |row|
            Item.new(row)
        end
        ap @frontpage_items
        slim :index
    end

    get '/account/login' do
        slim :frontPage
    end

    get '/account/category/:category_name' do
        @category_name = Database.get_category(params["category_name"])
        @items = Database.get_item_by_category(@category_name.name)
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

        Database.create_user(username, phone, mail, password)

        redirect '/'
    end

    post '/account/login' do
        user = Database.get_user(params['username'])
        hashed_pwd = BCrypt::Password.new(user.password)
        if hashed_pwd == params['password']
            session[:user_id] = user.id
        end
        redirect back
    end

    get '/account/cart' do
        slim :cart
    end 

    post '/account/logout' do
        session.destroy
        redirect '/'
    end

    post '/account/addToCart/:id' do
        
    end
end

#TODO
#      create system so that if the item is not in stock it will be shown as unavailable
#      error message at login if password or username is incorrect
#      Move map to a separate function 
