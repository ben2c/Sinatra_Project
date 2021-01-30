class SessionsController < ApplicationController

    get '/login' do 
        erb :'session/login'
    end

    post '/login' do 
        begin
            authenticate(params[:email], params[:password])
            redirect '/home'
        rescue AuthError => e
            @errors = ["Wrong info entered, please try with correct email and/or password"]
            erb :'session/login'
        end
    end
    
    get '/signup' do
        erb :'session/signup'
    end
    

end