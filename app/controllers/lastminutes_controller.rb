class LastminutesController < InheritedResources::Base
  layout 'application'
  
  before_filter :find_country, :only => [ :search, :show ]
  actions :index, :search, :show
  respond_to :html
  
  def index
    @properties = Property.where(:published => true, :purpose_ids => "lastminute").asc(:order_no).page params[:page]
  end
  
  def search
    @properties = Property.where(:published => true, :purpose_ids => "lastminute", :country_id => params[:country_id]).asc(:order_no).page params[:page]
    if params[:country_id].present?
      @country = Country.find(params[:country_id])
    end
  end
  
  def show
    @property = Property.find(params[:id])
    @photos = Photo.where(property_id: @property.id, published: true).order_by([:order_no, :asc])
    @json = @property.to_gmaps4rails do |property, marker|
      marker.json :lat => property.latitude, :lng => property.longitude
    end
  end
  
  
  private
  
    def find_country
      @country = Country.find(params[:country_id])
    end
    
end