class Member::PropertiesController < InheritedResources::Base
  layout 'member'
  
  actions :all
  respond_to :html
end
