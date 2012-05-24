class Member::DashboardController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'member'

  actions :index
  respond_to :html, :xml

  def index
  end
end
