class LocationsController < InheritedResources::Base
  actions :about
  respond_to :html
  
  def about
  end
end
