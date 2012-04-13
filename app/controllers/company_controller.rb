class CompanyController < InheritedResources::Base
  actions :about, :team, :testimonials
  respond_to :html
  
  def about
  end
  
  def team
    @members = Member.where(published: true).asc(:order_no)
  end

  def testimonials
    @testimonials = Testimonial.where(published: true).asc(:order_no)
  end
end
