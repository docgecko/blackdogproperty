class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  
  field :ip_address,            :type => String
  field :first_name,            :type => String
  field :last_name,             :type => String
  field :card_type,             :type => String
  field :card_expires_on,       :type => Date
  field :amount,                :type => Float
  field :subscription_type,     :type => String
  field :start_date,            :type => Date
  field :end_date,              :type => Date
  field :recurring,             :type => Boolean
  field :purchased_at,          :type => DateTime

  embedded_in :user
  has_many :transactions

  attr_accessor :card_number, :card_verification
  
  validate :validate_card, :on => :create
  
  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    logger.debug "response: #{response}"
    transactions.create!(:action => "subscription", :amount => price_in_cents, :response => response)
    self.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def price_in_cents
    20.00
    logger.debug "price_in_cents: #{price_in_cents}"
  end
  
private

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add :base, message
        # errors[:base] << message
        logger.debug "message: #{message}"
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end
