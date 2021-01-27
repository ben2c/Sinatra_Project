#ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require "sinatra"
require "active_record"
require "sinatra/activerecord"
require 'sinatra/activerecord/rake'

desc "Allows console to have access to Models and Database"
task :console do 
    Pry.start
end
