require 'twilio-ruby'

module CommentsHelper
	# skip_before_action :verify_authenticity_token

	  def send_sms(body)
	      twilio_sid = "AC86a90d3fe3d250b68f967eb3aa420e32"
	      twilio_token = "4d0e716064fbf6aae64397c90dc09c9c"
	      twilio_phone_number = "6503962627"

	      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

	      @twilio_client.account.sms.messages.create(
	        :from => "6503962827",
	        :to => "6508420775",
	        :body => body
	      )

	      # render :nothing => true
	      # redirect_to(:back)
	  end
end