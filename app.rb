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
    TEST_PAGES = %w(hubspot original webdev)

    # Home Page 
    get '/' do
      erb :index
    end

    # GET Requests
    MAIN_MENU.each do |page|
      get "/#{page}/?" do
        erb "#{page}".to_sym
      end
    end

    LEARN_MORE.each do |page|
      get "/learnmore/#{page}/?" do
        erb "learnmore/#{page}".to_sym
      end
    end
    
    # => TODO: Remove for Prod
    TEST_PAGES.each do |page|
      get "/test/#{page}/?" do
        erb "test/#{page}".to_sym
      end
    end

    # POST Requests

    # => TODO: Implement Custom 404 page.
    # =======> Redirect to Home Page (JS?)
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

      def link_to(url, text = url, opts = {})
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