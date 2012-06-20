ActionMailer::Base.delivery_method = :smtp

if Rails.env.staging?
  ActionMailer::Base.smtp_settings = {
    :user_name => "app4264979@heroku.com",
    :password => "nwiu0joh",
    :domain => "blackdogproperty.heroku.com",
    :address => "smtp.sendgrid.net",
    :port                 => 587,
    :authentication       => "plain",
    :enable_starttls_auto => true  
  }
else
  ActionMailer::Base.smtp_settings = {
    :user_name => "app5401656@heroku.com",
    :password => "gxheme9j",
    :domain => "blackdogproperty-staging.heroku.com",
    :address => "smtp.sendgrid.net",
    :port                 => 587,
    :authentication       => "plain",
    :enable_starttls_auto => true  
  }
end
