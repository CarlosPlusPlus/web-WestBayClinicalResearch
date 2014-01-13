module Sinatra
  module JavaScriptHelper
    def path_to script
      case script
        when :angular    then 'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.7/angular.min.js'
        when :backbone   then 'http://cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.0/backbone-min.js'
        when :jquery     then 'http://code.jquery.com/jquery-latest.min.js'
        when :underscore then 'http://underscorejs.org/underscore-min.js'
        else "/js/#{script}.js"
      end
    end

    def javascripts(*args)
      js = []
      js << settings.javascripts if settings.respond_to?('javascripts')
      js << args
      js << @js if @js
      js.flatten.uniq.map do |script| 
        "<script src=\"#{path_to script}\"></script>"
      end.join
    end

    def js(*args)
      @js ||= []
      @js = args
    end
  end

  helpers JavaScriptHelper
end