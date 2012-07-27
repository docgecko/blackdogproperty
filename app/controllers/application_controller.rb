class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      if current_user.role == "registered"
        flash[:error] = "Access denied! You must complete your subscription payment before continuing."
        redirect_to member_registration_payment_path
      else
        flash[:error] = "Access denied! You do not have access to that page or the page does not exist."
        redirect_to stored_location_for(resource) || member_dashboard_index_path
      end
    else
      flash[:error] = "Access denied! You do not have access to that page or the page does not exist."
      redirect_to root_url
    end
  end
end
