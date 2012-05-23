class RenovationsController < InheritedResources::Base
  layout 'application'
  
  actions :index, :about
  respond_to :html
  
  def index
  end
  
  def about
  end
end
