class RentalsController < InheritedResources::Base
  actions :index, :search, :show
  respond_to :html
  
  def index
    @properties = Property.where(:published => true, :type_ids => "rental").asc(:order_no)
  end
  
  def search
    @properties = Property.where(:published => true, :type_ids => "rental", :country_id => params[:country_id]).asc(:order_no)
    @country = Country.find(params[:country_id])
  end
  
  def show
    @property = Property.find(params[:id])
  end
end
