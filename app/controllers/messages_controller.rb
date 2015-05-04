class MessagesController < ApplicationController
  def index
    client
  end

  private

  def client
    twilio_phone_number = "YOUR NUMBER HERE"
    account_sid = 'YOUR KEY HERE'
    auth_token = 'YOUR KEY HERE'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
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
