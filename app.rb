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

    get '/original' do        # Remove for PROD.
      erb :'static/original'
    end

    # CONTROLLER: Test Pages

    get '/hubspot' do         # Remove for PROD.
      erb :'test/hubspot'
    end

    get '/webdev' do          # Remove for PROD.
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