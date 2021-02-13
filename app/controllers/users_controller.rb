class UsersController < ApplicationController

    get '/users/:slug' do 
        authenticate
        @users = Users.find_by_slug(params[:slug])
        erb :'user/show_user'
    end

end