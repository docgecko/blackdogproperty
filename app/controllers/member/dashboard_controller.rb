class Member::DashboardController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'dashboard'

  actions :index
  respond_to :html, :xml

  def index
    @user = User.find(current_user.id)
    @section = 'profile'
    @properties = Property.where(user_id: current_user.id)
  end
end
