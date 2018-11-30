Database.clear
class App < Sinatra::Base

    enable :sessions

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
         
    end

end