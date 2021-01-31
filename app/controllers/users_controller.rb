class UsersController < ApplicationController

    get '/users' do 
        @users = Users.all 
        erb :'users/index'
    end

    post '/users' do 
        @user = Users.create(name: params[:name], email: params[:email], password: params[:password])
        if @user.errors.any?
            @errors = @user.errors.messages
            erb :'sessions/signup'
        else
            session[:user_id] = @user.id
            redirect '/home'
        end
    end

    get '/users/:id' do 
        @user = Users.find_by(id: params[id])
        erb :'users/show'
    end
end