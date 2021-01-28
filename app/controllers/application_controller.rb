class ApplicationController < Sinatra::Base 

    configure do    
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "secret"
        #set :show_exceptions, false  #enable in dev env by default

    end

    get '/' do 
        erb :root
    end


end