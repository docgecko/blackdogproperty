class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      if current_user.role? :registered
        # flash[:error] = "only a registered user"
        flash[:alert] = "You must complete your subscription payment before continuing."
        redirect_to member_registration_payment_url
      elsif current_user.role? :subscribed
        # flash[:alert] = "You must complete your subscription payment before continuing."
        redirect_to member_dashboard_index_url
      end
    else
      flash[:alert] = "only a guest to the site"
      # flash[:error] = "Access denied! You do not have access to that page or the page does not exist."
      redirect_to root_url
    end
  end
end
