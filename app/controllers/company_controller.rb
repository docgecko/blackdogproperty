class CompanyController < InheritedResources::Base
  actions :index
  respond_to :html
  
  def index
  end
end
