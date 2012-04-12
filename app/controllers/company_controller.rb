class CompanyController < InheritedResources::Base
  actions :index, :team
  respond_to :html
  
  def index
  end
  
  def team
    @members = Member.where(published: true).asc(:order_no)
  end

  def testimonials
    @testimonials = Testimonial.where(published: true).asc(:order_no)
  end
end
