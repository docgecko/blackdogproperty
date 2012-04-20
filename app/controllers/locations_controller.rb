class LocationsController < InheritedResources::Base
  actions :about
  respond_to :html
  
  def about
  end
  
  def country
    @country = Country.find(params[:id])
  end
end
