class CompanyController < InheritedResources::Base
  actions :index, :team
  respond_to :html
  
  def index
  end
  
  def team
    @members = Member.where(published: true).asc(:order_no)
  end
end
