class ApplicationController < Sinatra::Base 

    configure do    
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "secret"
        set :show_exceptions, false 

    end

    get '/' do 
        erb :root
    end

    get '/home' do 
        authorize
        erb :home
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    helpers do 
        def logged_in?
            !!current_user
        end

        def current_user
            @current_user ||= Users.find(session[:user_id]) if session[:user_id]
        end

    end
end