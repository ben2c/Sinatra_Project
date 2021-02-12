class SessionsController < ApplicationController

    get '/login' do
        @failed = false
        redirect '/records/index' if logged_in?
        erb :"session/login"
    end

    post '/login' do
        user = Users.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/records'
        else
            @failed = true
            erb :"session/login"
        end
    end
    
    get '/signup' do
        erb :'user/show' if logged_in?
        @user = Users.new
        erb :"session/signup"
    end
    
    post '/signup' do
        @user = Users.create(name: params[:name], email: params[:email], password: params[:password])

        if @user.errors.any?
            session[:user_id] = @user.id
            erb :"session/signup"
        else
            session[:user_id] = @user.id
            redirect '/show'
        end
    end
end