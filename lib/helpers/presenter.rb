module Sinatra
  module PresenterHelper
    def thank_you_action(action)
      respond = "We will respond to you shortly."

      case action
      when "contact","sponsor"  then "contacting us! " + respond
      when "newsletter"         then "subscribing to our newsletter!"
      when "volunteer"          then "volunteering for a trial! " + respond
      end
    end

    def thank_you_url(action)
      "http://#{ domain }/thankyou?action=#{ action }"
    end
  end

  helpers PresenterHelper
end