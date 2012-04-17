if Rails.env.development? or Rails.env.test?
  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {  
    :address              => "smtp.gmail.com",  
    :port                 => 25,
    :domain               => "blackdogproperty.com",  
    :user_name            => "contact@blackdogproperty.com",  
    :password             => "We1shB0y",
    :authentication       => "plain",  
    :enable_starttls_auto => true  
  }
end