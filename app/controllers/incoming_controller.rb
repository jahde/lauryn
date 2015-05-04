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
      if body == "Lauryn, what is my current location?"
          r.Message "Ready Or Not, Here I Come, You Can't Hide.
Gonna Find You and Take it Slowly"
      else
          r.Message "You might win some but you just lost one"
      end
      # r.Message "What up bruh."
    end

    render 'send_message.xml.erb', :content_type => 'text/xml'
  end

end

# What is the meaning of life?
# Oooh La La La La La La Lalala La Laaah
# A sweeeeet thing

# What is my current location?
# Ready Or Not, Here I Come, You Can't Hide
# Gonna Find You and Take it Slowly

# other question:
# You might win some but you just lost one
