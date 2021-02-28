class RecordsController < ApplicationController

    get '/records' do
        authenticate
        @user = current_user
        @records = Records.all
        #@record = Records.find_by(id: params[:id])
        erb :'records/records'
    end

    get '/records/new' do 
        authenticate
        @user = current_user
        @record = Records.new
        erb :'records/new'
    end

    post '/records' do
        @user = current_user
        @record = Records.create(p_name: params[:p_name], sex: params[:sex], age: params[:age], disease: params[:disease])
        @records = Records.all
        if @record.errors.any?
        erb :"records/new"
        else
        erb :"records/records"
        end
    end

    delete '/records/:id/delete' do 
        @record = Records.find_by(id: params[:id])
        @record.delete
 
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
        @record.update(p_name: params[:p_name], sex: params[:sex], age: params[:age], disease: params[:disease])
                
        if @record.errors.any?
        erb :"/records/edit"
        else
        erb :"records/show_record"
        end
    end

    get '/records/:id' do  
        @failed = false
        authenticate
        @records = Records.all
        @record = Records.find_by_id(params[:id])
        redirect '/records' if @record.nil?
        erb :"records/show_record"
    end
end