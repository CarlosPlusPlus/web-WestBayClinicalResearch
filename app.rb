require 'bundler'
Bundler.require

require_relative 'environment'

module WBCR
  class App < Sinatra::Application

    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    # Index 
    get '/' do
      erb :'static/index'
    end

    # Learn More
    # => Contact Us, Facility/Services, Team

    get '/learnmore/:page' do
      erb "static/#{params[:page]}".to_sym
    end
    
    # CONTROLLER: Test Pages
    # ==> Remove for PROD.

    get '/original' do
      erb :'test/original'
    end

    get '/hubspot' do 
      erb :'test/hubspot'
    end

    get '/webdev' do  
      erb :'test/webdev'
    end

    # Helpers
    helpers do
      # ==> Enable partials in all templates.
      def partial(file_name)
        erb file_name, :layout => false
      end

      def h(text)
        # ==> Capability to escape HTML.
        Rack::Utils.escape_html(text)
      end
    end
    
  end
end