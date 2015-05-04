class MessagesController < ApplicationController
  def index
    client
  end

  private

  def client
    account_sid = 'AC963408da3e7c1fbc06511e5cda6a0e9e'
    auth_token = '0c2ce2f9669a32c23a9f82bc44b30b53'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client
  end
end
