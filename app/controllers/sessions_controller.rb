class SessionsController < ApplicationController

    get '/login' do
        @failed = false
        redirect '/records' if logged_in?
        erb :"user/login"
    end

    post '/login' do
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/records'
        else
            @failed = true
            erb :"user/login"
        end
    end
    
    get '/signup' do
        redirect '/records' if logged_in?
        @user = User.new
        erb :"user/signup"
    end
    
    post '/signup' do
        @user = User.create(name: params[:name], email: params[:email], password: params[:password])

        if @user.errors.any?
            session[:user_id] = @user.id
            erb :"user/signup"
        else
            session[:user_id] = @user.id
            redirect '/records'
        end
    end
end