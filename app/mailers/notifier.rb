class Notifier < ActionMailer::Base
  
  def support_notification(sender)
    @sender = sender
    mail(:to => sender.email,
      :bcc => "enquiries@blackdogproperty.com",
      :from => sender.email,
      :subject => "Contact BlackDog Property")
  end
end
