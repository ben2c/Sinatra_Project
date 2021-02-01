class RecordsController < ApplicationController

    get '/records' do
        authorize
        @records = Records.all
        erb :'records/index'
    end

    get '/records/new' do 
        authorize
        erb :'records/new'
    end

    post '/records' do 
        authorize
        user = current_user
        user.records.build(sex: params[:sex], age: params[:age], disease: params[:disease])
        redirect '/records'
    end

    delete '/records/:id' do 
        record = Records.find_by(id: params[:id])
        authorize_user(record)
        user = current_user
        if record 
            record.destroy
            redirect '/users/#{user.id}'
        end
    end

    get '/records/:id/edit' do
        @record = Records.find_by(id: params[:id])
        authorize_user(@record)
        erb :'records/edit'
    end

    patch '/runs/:id' do 
        user = current_user
        @record = Records.find_by(id: params[:id])
        authorize_user(@record)
        @record.update(sex: params[:sex], age: params[:age], disease: params[:disease])
        redirect '/users/#{user.id}'
    end

end