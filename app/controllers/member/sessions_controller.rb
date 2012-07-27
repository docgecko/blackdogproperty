class Member::SessionsController < Devise::SessionsController

protected

  def after_sign_in_path_for(resource)
    if current_user.role == "registered"
      member_registration_payment_path
    else
      stored_location_for(resource) || member_dashboard_index_path
    end
  end
end
