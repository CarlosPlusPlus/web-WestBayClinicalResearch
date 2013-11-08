# Require all Ruby gems located in Gemfile.
require 'bundler'
Bundler.require

# Include all models in lib/*/ folders.
require_relative 'environment'

module WBCR
  class App < Sinatra::Application

    # Configure Options

    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    # CONTROLLER: Static Pages

    get '/' do
      erb :'static/index'
    end

    get '/facility' do
      erb :'static/facility'
    end

    get '/services' do
      erb :'static/services'
    end

    get '/team' do
      erb :'static/team'
    end

    # CONTROLLER: Test Pages
    # ==> Remove for PROD.

    get '/original' do
      erb :'static/original'
    end

    get '/hubspot' do 
      erb :'test/hubspot'
    end

    get '/webdev' do  
      erb :'test/webdev'
    end

    # Helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end
    
  end
end