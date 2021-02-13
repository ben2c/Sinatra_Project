class SessionsController < ApplicationController

    get '/login' do
        @failed = false
        redirect '/records' if logged_in?
        erb :"user/login"
    end

    post '/login' do
        user = Users.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/records'
        else
            @failed = true
            erb :"user/login"
        end
    end
    
    get '/signup' do
        erb :'/records' if logged_in?
        @user = Users.new
        erb :"user/signup"
    end
    
    post '/signup' do
        @user = Users.create(name: params[:name], email: params[:email], password: params[:password])

        if @user.errors.any?
            session[:user_id] = @user.id
            erb :"user/signup"
        else
            session[:user_id] = @user.id
            redirect '/records'
        end
    end
end