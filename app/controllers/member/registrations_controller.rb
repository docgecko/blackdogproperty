class Member::RegistrationsController < Devise::RegistrationsController
  layout :resolve_layout
  
  
  protected

    def after_sign_up_path_for(resource)
      root_url
    end
    
    def resolve_layout
      case action_name
      when "edit", "update"
        "account"
      else
        "authentication"
      end
    end
end
