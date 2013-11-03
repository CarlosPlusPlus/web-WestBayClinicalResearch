# Require all Ruby gems located in Gemfile.
require 'bundler'
Bundler.require

# Include all models in lib/*/ folders.
require_relative 'environment'

module WBCR
  class App < Sinatra::Application

    # Configure Options
    # => set default paths of application.
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    # Filters
    # => add route filters if necessary.

    # Routes
    # => define controller actions for application.
    get '/' do
      erb :'static/index'
    end

    get '/original' do
      erb :'static/original'
    end

    # Helpers
    # => define helper methods for application.
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end
  end
end