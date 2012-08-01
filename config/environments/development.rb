Blackdogproperty::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  ### ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'blackdogproperty.dev' }
  # # A dummy setup for development - deliveries, and errors logged
  # config.action_mailer.delivery_method = :sendmail
  # config.action_mailer.perform_deliveries = true
  # config.action_mailer.raise_delivery_errors = true
  # config.action_mailer.default :charset => "utf-8"
  
  # Active Merchant for Paypal Gateway
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test
    ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
      :login => "seller_1343829925_biz_api1.gmail.com",
      :password => "1343829974",
      :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AdieqhrtnrRaK5r-96r5e-nRQGA6"
    )
  end
end
