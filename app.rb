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
    # => Contact Us, Facility, Team
    get '/learnmore/:page' do
      erb "static/#{params[:page]}".to_sym
    end
    
    # Test Pages [REMOVE FOR PROD]
    # => Original, Hubspot, WebDev
    get '/test/:page' do
      erb "test/#{params[:page]}".to_sym
    end

    # Helper Functions
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