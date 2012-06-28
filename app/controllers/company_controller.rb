class CompanyController < InheritedResources::Base
  layout 'application'
  
  actions :about, :team, :testimonials
  respond_to :html
  
  def about
  end
  
  def team
    @members = Member.where(published: true).asc(:position)
  end

  def testimonials
    @testimonials = Testimonial.where(published: true).asc(:position)
  end
end
