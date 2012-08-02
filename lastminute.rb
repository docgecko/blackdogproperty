require 'rubygems'
require 'active_merchant'

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "seller_1343829925_biz_api1.gmail.com",
  :password => "1343829974",
  :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AdieqhrtnrRaK5r-96r5e-nRQGA6"
)

credit_card = ActiveMerchant::Billing::CreditCard.new(
  :type               => "visa",
  :number             => "4024007148673576",
  :verification_value => "123",
  :month              => 1,
  :year               => Time.now.year+1,
  :first_name         => "Daren",
  :last_name          => "Warburton"
)

payment_options = {
  :ip => "127.0.0.1",
  :currency => 'GBP'
}

# if credit_card.valid?
#   puts "Credit card is valid."
# else
#   puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
# end

if credit_card.valid?
  # or gateway.purchase to do both authorize and capture
  # response = gateway.purchase(1000, credit_card, :ip => "127.0.0.1")
  response = gateway.authorize(2000, credit_card, payment_options)
  if response.success?
    gateway.capture(2000, response.authorization)
    puts "Purchase complete!"
    puts "Success: #{response.message}"
  else
    puts "Error: #{response.message}"
  end
else
  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
end