require 'bundler'
Bundler.require

require_relative 'environment'

module WBCR
  class App < Sinatra::Application

    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #####################
    # Route Definitions #
    #####################

    MAIN_MENU  = %w(contact)
    LEARN_MORE = %w(facility team)

    # Home Page 
    get '/' do
      erb :index
    end

    # Main Menu
    MAIN_MENU.each do |page|
      get "/#{page}/?" do
        erb "#{page}".to_sym
      end
    end
    
    # Learn More
    LEARN_MORE.each do |page|
      get "/learnmore/#{page}/?" do
        erb "learnmore/#{page}".to_sym
      end
    end
    
    # Test Pages [TODO: Remove for Prod]
    # => Original, Hubspot, WebDev
    get '/test/:page/?' do
      erb "test/#{params[:page]}".to_sym
    end

    # Custom 404 page for unknown routes.
    # => TODO: Implement Custom 404 page.
    not_found do
      'PAGE HAS NOT BEEN FOUND.'
    end

    ####################
    # Helper Functions #
    ####################

    helpers do
      def h(text)
        Rack::Utils.escape_html(text)
      end

      def link_to(url,text=url,opts={})
        attributes = ""
        opts.each { |key,val| attributes << key.to_s << "=\"" << val << "\" "}
        "<a href=\"#{url}\" #{attributes}>#{text}</a>"
      end

      def partial(file_name)
        erb file_name, :layout => false
      end
    end
    
  end
end