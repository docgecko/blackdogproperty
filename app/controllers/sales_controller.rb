class SalesController < InheritedResources::Base
  actions :index
  respond_to :html
  
  def index
  end
end
