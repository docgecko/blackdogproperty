class Member::DashboardController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource :class => false
  layout 'dashboard'
  
  force_ssl
  
  actions :index
  respond_to :html

  def index
    @user = User.find(current_user.id)
    @section = 'profile'
    @properties = Property.where(user_id: current_user.id)
  end
end
