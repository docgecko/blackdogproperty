class LocationsController < InheritedResources::Base
  layout 'application'
  
  actions :about
  respond_to :html
  
  def about
  end
  
  def country
    @country = Country.find(params[:id])
  end
end
