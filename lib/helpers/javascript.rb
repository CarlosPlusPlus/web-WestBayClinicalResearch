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
          "<script src=\"#{script}\"></script>"
        end.join
      end
  end

  helpers JavaScriptHelper
end