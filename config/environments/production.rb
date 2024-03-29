Blackdogproperty::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Rewrite rules
  config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
    r301 %r{.*}, 'http://blackdogproperty.com$&',
      :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != 'blackdogproperty.com' }
  end
  
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx
  config.action_dispatch.x_sendfile_header = nil

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += %w( 'bootstrap-tab.js'
                                  'bootstrap-tooltip.js'
                                  'hoverIntent.js'
                                  'jquery-ui.js'
                                  'jquery,ad-gallery.js'
                                  'jquery.charcounter.js'
                                  'jquery.easytabs.min.js'
                                  'jquery.hashchange.min.js'
                                  'jquery.placeholder.min.js'
                                  'jquery.textareaCounter.plugin.js'
                                  'jquery.validate.min.js'
                                  'superfish.js'
                                  'bootstrap.min.css'
                                  'jquery.ad-gallery.css'
                                )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false
  
  # config.action_mailer.default_url_options = { :host => 'blackdogproperty.com' }

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  # config.i18n.fallbacks = true
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
  
  # Active Merchant for Paypal Gateway
  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :production
    ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
      :login => "mark_api1.blackdogproperty.com",
      :password => "KAZGA4GRFBZM6L9M",
      :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AqV-obEvsJLeCfTQm2INlNkXlwpj"
    )
  end

end
