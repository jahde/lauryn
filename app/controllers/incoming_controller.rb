class IncomingController < ApplicationController
  # def send_text_message
  #   client
  #   number_to_send_to = params[:number_to_send_to]

  #   @client.account.sms.messages.create(
  #     :from => "+1#{twilio_phone_number}",
  #     :to => number_to_send_to,
  #     :body => "This is an message. It gets sent to #{number_to_send_to}"
  #   )
  # end

  # def send_message
  # sender = params[:From]
  # body = params[:Body]
  #
  #   Twilio::TwiML::Response.new do |r|
  #       if body == "hello"
  #           r.Message "Hi!"
  #       elsif body == "bye"
  #           r.Message "Goodbye"
  #       end
  #   end.text
  # end

  def send_message
    body = params[:Body]

    @twiml = Twilio::TwiML::Response.new do |r|
      # if body == "hello"
      #     r.Message "Hi!"
      # else
      #     r.Message "Wagwan star! I got a text from you."
      # end
      r.Message "What up bruh."
    end

    render 'send_message.xml.erb', :content_type => 'text/xml'
  end


  private

  def client
    twilio_phone_number = "9734594512"
    account_sid = 'AC963408da3e7c1fbc06511e5cda6a0e9e'
    auth_token = '0c2ce2f9669a32c23a9f82bc44b30b53'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
