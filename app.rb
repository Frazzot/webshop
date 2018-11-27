Database.clear
class App < Sinatra::Base

    get '/' do
        slim :index
    end

    get '/account/login' do
        slim :frontPage
    end
end