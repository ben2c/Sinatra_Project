#ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require "sinatra"
require "active_record"
require "sinatra/activerecord"
require 'sinatra/activerecord/rake'

desc "Allows console to access DB"
task :console do 
    Pry.start
end
