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
        slim :index
    end

    get '/account/login' do
        slim :frontPage
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

    post '/account/logout' do
        session.destroy
        redirect '/'
    end

end

#TODO: get for new pages and slim files + css
#      category system with different pages etc (basically more content)
#      add name on welcome page (index.slim)