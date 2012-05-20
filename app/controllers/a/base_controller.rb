module A
  class BaseController < InheritedResources::Base
    before_filter :verify_admin
  
    private
  
      def verify_admin
        if current_user.present?
          redirect_to root_url, :alert => "The page your are looking for either does not exist or requires admin privelages." unless current_user.admin?
        end
      end
  end
end
