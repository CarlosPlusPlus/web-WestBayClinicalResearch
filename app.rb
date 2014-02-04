require_relative 'environment'

module WBCR
  class App < Sinatra::Application
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    set :javascripts, [:jquery, 'grids', 'newsletter']

    MAIN_MENU  = %w(blog contact faq)
    LEARN_MORE = %w(about facility experience sponsor)
    TRIALS     = %w(heart-attack ulcerative-colitis upcoming-trials volunteer)

    get '/' do
      @no_container = true
      js 'index'
      erb :index
    end

    MAIN_MENU.each do |page|
      get "/#{page}/?" do
        @no_container = true if page =='contact'
        erb "#{page}".to_sym
      end
    end

    LEARN_MORE.each do |page|
      get "/learnmore/#{page}/?" do
        js 'team'     if page == 'about'
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
        redirect '/'
      else
        @action = thank_you_action(params[:action])
        erb :thankyou
      end
    end

    error do
      redirect '/'
    end

    not_found do
      redirect '/'
    end

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