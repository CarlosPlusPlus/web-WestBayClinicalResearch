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
    LEARN_MORE = %w(about facility)
    TRIALS     = %w(information sponsor volunteer)

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
        js 'bxslider' if page == 'facility'
        erb "learnmore/#{page}".to_sym
      end
    end

    TRIALS.each do |page|
      get "/trial/#{page}/?" do
        erb "trial/#{page}".to_sym
      end
    end

    get "/thankyou/?" do
      if params[:action].nil?
        erb "404".to_sym
      else
        @action = thank_you_action(params[:action])
        erb :thankyou
      end
    end

    # => TODO: Implement Custom 404 page.
    # =======> Redirect to Home Page (JS?)
    error do
      erb "404".to_sym
    end

    not_found do
      erb "404".to_sym
    end

    ####################
    # Helper Functions #
    ####################

    helpers do
      def domain
        request.host_with_port
      end

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