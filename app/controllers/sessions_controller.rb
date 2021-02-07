class SessionsController < ApplicationController

    get '/login' do
        if logged_in?
        redirect to "/users/#{current_user.id}"
        else
        erb :'session/login'
        end
    end

    post '/login' do
        @user = Users.find_by(email: params[:email], password: params[:password])
        if !@user.nil?
        session[:user_id] = @user.id
        current_user
        erb :'/home'
        else
        redirect to '/login'
        end
    end
    
    get '/signup' do
        if logged_in?
        redirect to "/users/#{current_user.id}"
        else
        erb :'/users/create_user'
        end
    end
    
    post '/signup' do
        @user = User.new(email: params[:email], password: params[:password])
        if @user.save
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}"
        else
        redirect to '/signup'
        end
    end
end