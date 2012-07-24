require 'rubygems'
require 'active_merchant'

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "seller_1342778658_biz_api1.gmail.com",
  :password => "1342778700",
  :signature => "AXZrrxV2tdhWR2DzSAKtzSlaLBwWAnabSAhk1-kGQHB-pt85GcUrZ2ok"
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

# if credit_card.valid?
#   puts "Credit card is valid."
# else
#   puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
# end

if credit_card.valid?
  # or gateway.purchase to do both authorize and capture
  response = gateway.authorize(1000, credit_card, :ip => "127.0.0.1")
  if response.success?
    gateway.capture(1000, response.authorization)
    puts "Purchase complete!"
  else
    puts "Error: #{response.message}"
  end
else
  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
end