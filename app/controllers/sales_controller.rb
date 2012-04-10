class SalesController < InheritedResources::Base
  actions :index, :show
  respond_to :html
  
  def index
  end
  
  def show
  end
end
