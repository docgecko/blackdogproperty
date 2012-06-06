class Member::DashboardController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'dashboard'

  actions :index
  respond_to :html, :xml

  def index
  end
end
