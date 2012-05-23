class SalesController < InheritedResources::Base
  layout 'application'
  
  actions :about
  respond_to :html
  
  def about
  end
end
