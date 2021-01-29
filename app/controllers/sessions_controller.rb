class SessionsController < ApplicationController

    get '/login' do 
        erb :'session/login'
    end

    get '/signup' do
        erb :'session/signup'
    end
    
end