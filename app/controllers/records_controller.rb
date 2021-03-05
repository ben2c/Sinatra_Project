class RecordsController < ApplicationController

    get '/records' do
        authenticate
        @user = current_user
        @records = Record.all
        erb :'records/records'
    end

    get '/records/new' do 
        authenticate
        @record = user.Record.new
        erb :'records/new'
    end

    post '/records' do
        @user = current_user
        @records = Record.all
        if logged_in?
            @record = Record.new(params)
            if @record.save 
                    erb :"records/records"
                else 
                    erb :"records/else"
                end
        end
    end

    delete '/records/:id/delete' do 
        @record = Record.find_by(id: params[:id])
        @record.delete
 
        redirect '/records'
    end

    get '/records/:id/edit' do
        @record = Record.find_by(id: params[:id])
        authenticate
        if logged_in? 
        erb :"records/edit"
        else
        @failed = true
        erb :"records/show_record"
        end
    end

    patch '/records/:id' do
        @record = Record.find_by(id: params[:id])
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
        @records = Record.all
        @record = Record.find_by_id(params[:id])
        redirect '/records' if @record.nil?
        erb :"records/show_record"
    end
end