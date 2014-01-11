require 'bundler'
Bundler.require

require_relative 'environment'

module WBCR
  class App < Sinatra::Application

    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    set :javascripts, [:jquery, 'newsletter']

    #####################
    # Route Definitions #
    #####################

    MAIN_MENU  = %w(blog contact faq)
    LEARN_MORE = %w(facility team)
    TRIALS     = %w(information sponsor volunteer)
    TEST_PAGES = %w(hubspot original webdev)

    # Home Page 
    get '/' do
      @index = true
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
        js 'bxslider'
        erb "learnmore/#{page}".to_sym
      end
    end

    TRIALS.each do |page|
      get "/trial/#{page}/?" do
        erb "trial/#{page}".to_sym
      end
    end
    
    # => TODO: Remove for Prod
    TEST_PAGES.each do |page|
      get "/test/#{page}/?" do
        erb "test/#{page}".to_sym
      end
    end

    # => TODO: Implement Custom 404 page.
    # =======> Redirect to Home Page (JS?)
    not_found do
      erb "404".to_sym
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