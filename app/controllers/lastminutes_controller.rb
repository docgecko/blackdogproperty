class LastminutesController < InheritedResources::Base
  layout 'application'
  
  before_filter :find_country, :only => [ :search, :show ]
  actions :index, :search, :show
  respond_to :html
  
  def index
    @properties = Property.where(:published => true, :purpose_ids => "lastminute").asc(:order_no).page params[:page]
  end
  
  def search
    @properties = Property.where(:published => true, :purpose_ids => "lastminute", :country => @country).asc(:order_no).page params[:page]
  end
  
  def show
    @property = Property.find_by_slug(params[:id])
    @photos = Photo.where(property_id: @property.id, published: true).order_by([:order_no, :asc])
    @json = @property.to_gmaps4rails do |property, marker|
      marker.json :lat => property.latitude, :lng => property.longitude
    end
  end
  
  
  private
  
    def find_country
      if params[:country_id].present?
        if params[:id].present?
          @property = Property.find_by_slug(params[:id])
          logger.debug "Property id: #{@property.id}"
          @country = @property.country
        else
          @country = (params[:country_id].humanize).titleize
        end
      end
    end
    
end
