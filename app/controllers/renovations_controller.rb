class RenovationsController < InheritedResources::Base
  actions :index, :about
  respond_to :html
  
  def index
  end
  
  def about
  end
end
