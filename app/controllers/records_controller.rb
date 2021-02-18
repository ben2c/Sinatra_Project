class RecordsController < ApplicationController

    get '/records' do
        authenticate
        @user = current_user
        @records = Records.all
        erb :'records/records'
    end

    get '/records/new' do 
        authenticate
        @user = current_user
        @record = Records.new
        erb :'records/new'
    end

    post '/records' do 
        @record = Records.create(sex: params[:sex], age: params[:age], disease: params[:disease])
        if @record.errors.any?
        erb :"/new"
        else
        erb :"/records"
        end
    end

    delete '/records/:id' do 
        record = Records.find_by(id: params[:id])
        record.delete if record.user_id == current_user.id
    
        redirect '/records'
    end

    get '/records/:id/edit' do
        @record = Records.find_by(id: params[:id])
        authenticate
        if logged_in? && @record.user_id == current_user.id
        erb :"records/edit"
        else
        @failed = true
        erb :"records/show_record"
        end
    end

    patch '/records/:id' do
        @record = Records.find_by(id: params[:id])
        @record.update(sex: params[:sex], age: params[:age], disease: params[:disease])
                
        if @record.errors.any?
        erb :"/records/edit"
        else
        erb :"records/show_record"
        end
    end

    get '/records/:id' do  
        @failed = false
        authenticate
        @record = Records.find_by_id(params[:id])
        redirect '/records' if @record.nil?
        erb :"records/show_record"
    end
end