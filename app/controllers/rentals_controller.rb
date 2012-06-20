class RentalsController < InheritedResources::Base
  layout 'application'
  
  before_filter :find_country, :only => [ :search, :show ]
  before_filter :property_purpose, :only => [ :index, :search ]
  actions :index, :search, :show
  respond_to :html
  
  def index
    @properties = Property.where(:published => true, :purpose_ids => @purpose).asc(:position).page params[:page]
  end
  
  def search
    @properties = Property.where(:published => true, :purpose_ids => @purpose, :country => (params[:country_id]).capitalize).asc(:position).page params[:page]
  end
  
  def show
    @property = Property.find_by_slug(params[:id])
    @photos = Photo.where(property_id: @property.id, published: true).order_by([:position, :asc])
    @circles = @property.to_gmaps4rails do |property, circle|
      circle.json :lat => property.latitude, :lng => property.longitude, :radius => 600
    end
  end
  
  
  private
  
    def property_purpose
      @purpose = 'rental'
    end
  
    def find_country
      if params[:country_id].present?
        @country = Country.find(params[:country_id])
      end
    end
    
end
