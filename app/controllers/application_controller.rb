class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      if current_user.role == "registered"
        # flash[:error] = "registered failure"
        # flash[:error] = "Access denied! You must complete your subscription payment before continuing."
        redirect_to member_registration_payment_url
      # else
      #   # flash[:error] = "subscribed failure"
      #   # flash[:error] = "Access denied! You do not have access to that page or the page does not exist."
      #   redirect_to member_registration_payment_url
      end
    else
      # flash[:error] = "guest failure"
      # flash[:error] = "Access denied! You do not have access to that page or the page does not exist."
      redirect_to root_url
    end
  end
end
