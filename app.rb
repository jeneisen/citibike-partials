require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'dm-sqlite-adapter'
require './parser'
require './station'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/stations.db")

module Citibike
  class App < Sinatra::Application

    get '/stations/new' do
      erb :new
    end

    post '/stations' do
      debugger

      Station.create(params["station"])
    end


    get '/stations' do
      erb :index
    end

    get '/stations/:id' do
      erb :show
    end

    helpers do 
      def partial(view)
        erb view, :layout => false
      end
    end
    
    DataMapper.auto_upgrade!
  end
end