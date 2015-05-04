class MessagesController < ApplicationController
  def index
    client
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

# What is the meaning of life?
# Oooh La La La La La La Lalala La Laaah
# A sweeeeet thing

# What is my current location?
# Ready Or Not, Here I Come, You Can't Hide
# Gonna Find You and Take it Slowly

# other question:
# You might win some but you just lost one
