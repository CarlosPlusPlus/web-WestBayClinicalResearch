module Sinatra
  module JavaScriptHelper
      def js *scripts
        @js ||= []
        @js = scripts
      end

      def javascripts(*args)
        js = []
        js << settings.javascripts if settings.respond_to?('javascripts')
        js << args
        js << @js if @js
        js.flatten.uniq.map do |script| 
          "<script src=\"/js/#{script}.js\"></script>"
        end.join
      end
  end

  helpers JavaScriptHelper
end