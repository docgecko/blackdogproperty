if Rails.env.development? or Rails.env.test?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :user_name => "app4264979@heroku.com",
    :password => "nwiu0joh",
    :domain => "blackdogproperty.heroku.com",
    :address => "smtp.sendgrid.net",
    :port                 => 587,
    :authentication       => "plain",
    :enable_starttls_auto => true  
  }
end