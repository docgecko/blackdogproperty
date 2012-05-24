class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'member'
  
  actions :all
  respond_to :html
end
