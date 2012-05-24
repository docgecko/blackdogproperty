class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'member'
  
  actions :all
  respond_to :html
  
  def index
    @properties = Property.where(user_id: current_user.id)
  end
end
