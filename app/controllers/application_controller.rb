class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || member_dashboard_index_path
  end
end
