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

    # Home Page 
    get '/' do
      erb :index
    end

    # Learn More
    # => Facility, Team
    get '/learnmore/:subpage/?' do
      erb "learnmore/#{params[:subpage]}".to_sym
    end

    # Contact
    get '/:staticpage/?' do
      erb params[:staticpage].to_sym
    end
    
    # Test Pages [TODO: Remove for Prod]
    # => Original, Hubspot, WebDev
    get '/test/:page/?' do
      erb "test/#{params[:page]}".to_sym
    end

    # TODO: 404 Page for invalid routes?

    ####################
    # Helper Functions #
    ####################

    helpers do
      # ==> Enable partials in all templates.
      def partial(file_name)
        erb file_name, :layout => false
      end

      def link_to(url,text=url,opts={})
        attributes = ""
        opts.each { |key,val| attributes << key.to_s << "=\"" << val << "\" "}
        "<a href=\"#{url}\" #{attributes}>#{text}</a>"
      end

      def h(text)
        # ==> Capability to escape HTML.
        Rack::Utils.escape_html(text)
      end
    end
    
  end
end