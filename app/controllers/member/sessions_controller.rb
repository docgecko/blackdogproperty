class Member::SessionsController < Devise::SessionsController
  force_ssl

protected

  def after_sign_in_path_for(resource)
    if current_user.role? :registered
      member_registration_payment_url
    else
      stored_location_for(resource) || member_dashboard_index_url
    end
  end
end
