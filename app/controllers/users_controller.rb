class UsersController < ApplicationController

    get '/users/:slug' do 
        authenticate
        @users = User.find_by_slug(params[:slug])
        erb :'user/show_user'
    end

end