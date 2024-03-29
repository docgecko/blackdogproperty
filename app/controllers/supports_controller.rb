class SupportsController < InheritedResources::Base
  layout 'application'
  
  actions :new, :create
  respond_to :html
  
  def new
    # id is required to deal with form
    @support = Support.new(:id => 1)
  end

  def create
    @support = Support.new(params[:support])
    if @support.save
      Notifier.support_notification(@support).deliver
      redirect_to(root_url, :notice => "Thank you for your enquiry! We will respond shortly.")
    else
      render :new, :property_title => params[:property_title]
    end
  end
end
