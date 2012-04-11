class CompanyController < InheritedResources::Base
  actions :index, :team
  respond_to :html
  
  def index
  end
  
  def team
  end
end
