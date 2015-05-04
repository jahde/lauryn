== README

Lauryn is a rails 4 application that works like Siri through SMS. Follow the below steps:

#1 Create a Twilio account
First sign up for a Twilio developer account. The account is free and you will be given a certain amount of credit ($$$) to use on your account.

Remember that Twilio actually sends out SMS messages and/or voice calls which does cost money. (A simple google search will help you to find coupons that you can use to add more credit to your account, especially if you're a student!)

#2 Configure your account
During sign up Twilio will either send you a text message or a quick phone call to make sure you are not a spambot. We all hate those now don't we?
Input the verification code and then proceed to getting your phone number.

#3 Choose a phone number
Next get your Twilio number. This is a unique phone number given to you by Twilio which will allow you access to their voice calling and SMS messaging capabilities for the API.

Twilio will assign you a random phone number but you can choose your own based on your location.

#4 Add Twilio to your new Rails 4 app
Start up your rails new app

```ruby
rails new twilio-messages
```

Add the twilio gem to your Gemfile

```ruby
gem 'twilio-ruby'
```

#5 Add your aunthentication keys
You can find your authentication keys on your Twilio dev account. You will need both the account_sid and auth_token. For example let's say you wanted to show all incoming text messages on your rails view.

```ruby
# messages_controller.rb

class MessagesController < ApplicationController
  def index
    client
  end

  private

  def client
    twilio_phone_number = "9734594512"
    account_sid = 'FDlkje3553l;kj6ljfsafdasf'
    auth_token = 'SFDFAF78987FdfE889'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
```

Then in your view:

```ruby
<h1>Lauryn</h1>
<% @client.account.messages.list({}).each do |message| %>
<ul>
  <li><%= message.body %></li>
</ul>
<% end %>
```

#6 Test your app locally with ngrok
Since Twilio is looking for a live GET/POST request from your app you will not be able to integrate Twilio on localhost:3000 alone. You can use the ngrok gem which essentially creates a live webserver on the internet for your gem so that you can test it locally.

[Gem here](https://github.com/bogdanovich/ngrok-tunnel)

#7 configure your incoming/outgoing routes
This is how your app will retrieve data from Twilio and then process the incoming or outgoing requests. You MUST make sure that your controller#action matches what you have on your Twilio dev account.

```ruby
Rails.application.routes.draw do
  resources :messages
  get '/incoming', to: 'incoming#send_message'

  root 'messages#index'
```

#8 Handle incoming SMS and replying
Twilio allows you to handle incoming SMS messages and then reply to them based on their given body. Twilio uses a special XML format called TwiML that turns the SMS message into a hash containing a lot of data. You can use params[:Body] to respond to a given SMS through your matching controller#action.

```ruby
# incoming_controller.rb

class IncomingController < ApplicationController
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
```

Then make your relevant route using an XML view:
```ruby
#send_message.xml.erb

<Response>
  <Sms><%= @twiml.text %></Sms>
</Response>
```

#9 Change url to your server
Make sure your SMS url is set to GET and that it matches the same URL in your route.

[![Screen Shot 2015-05-04 at 9.37.20 AM.png](https://d23f6h5jpj26xu.cloudfront.net/qrepyfaga7jimq_small.png)](http://img.svbtle.com/qrepyfaga7jimq.png)

>>use twilio logs!!!

#10 Getting puma/postgres/heroku up and running
You will probably want to have your app go live on the internet. Heroku is a good server that you can use. For your first time: YOU WILL GET FRUSTRATED. Make sure you read the docs.

>>heroku logs tells you nothing
>>heroku run rails console is okay
>>heroku logs is your best friend

#11 Finally here are some final pointers in deploying:
Remember to always be pushing to heroku, some of your app updates might not get reflected in Twilio.

rails c = app.class

Do not name your methods reserve words like send

Twilio methods are case sensitive
Twilio::Twiml != Twilio::TwiML
Twilio::Rest::Client != Twilio::REST::Client






