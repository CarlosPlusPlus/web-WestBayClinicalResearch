module Sinatra
  module PresenterHelper
    
    # Social Media Group
    def email
      '<a href="mailto:info@westbayclinicalresearch.com"' +
        ' target="_blank" class="glyphicons e-mail"><i></i></a>'
    end

    def facebook
      '<a href="#" class="glyphicons facebook"><i></i></a>'
    end

    def google_plus
      '<a href="#" class="glyphicons google_plus"><i></i></a>'
    end

    def linked_in
      '<a href="http://www.twitter.com/wbcresearch"' +
        ' target="_blank" class="glyphicons twitter"><i></i></a>'
    end

    def twitter
      '<a href="http://www.linkedin.com/company/west-bay-clinical-research"' + 
        ' target="_blank" class="glyphicons linked_in"><i></i></a>'
    end

    def social_media_icons
      email + facebook + google_plus + linked_in + twitter
    end

    # Thank You Page
    def thank_you_action(action)
      respond = '<br><span class="tab">' + 
                'We will respond to you shortly.' +
                '</span>'

      '<b>Thank you for ' + 
      (
        case action
        when 'contact','sponsor' then 'contacting us!</b>' + respond
        when 'newsletter'        then 'subscribing to our newsletter!</b>'
        when 'volunteer'         then 'volunteering for a trial!</b>' + respond
        end
      )
    end

    def thank_you_url(action)
      "http://#{ domain }/thankyou?action=#{ action }"
    end
  end

  helpers PresenterHelper
end