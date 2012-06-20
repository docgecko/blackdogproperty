class LastminutesController < InheritedResources::Base
  layout 'application'
  
  before_filter :find_country, :only => [ :search, :show ]
  before_filter :find_amenities, :only => :show
  actions :index, :search, :show
  respond_to :html
  
  def index
    @properties = Property.where(:published => true, :purpose_ids => "lastminute").asc(:position).page params[:page]
  end
  
  def search
    @properties = Property.where(:published => true, :purpose_ids => "lastminute", :country => @country).asc(:position).page params[:page]
  end
  
  def show
    @property = Property.find_by_slug(params[:id])
    @photos = Photo.where(property_id: params[:id]).order_by([:position, :asc])
    @circles = @property.to_gmaps4rails do |property, circle|
      circle.json :lat => property.longitude, :lng => property.latitude, :radius => 600
    end
  end
  
  
  private
  
    def find_country
      if params[:country_id].present?
        if params[:id].present?
          @property = Property.find_by_slug(params[:id])
          @country = @property.country
        else
          @country = (params[:country_id].humanize).titleize
        end
      end
    end
    
    def find_amenities
      @amenities = Amenity.order_by([[:division_id, :asc], [:name, :asc]])
      @divisions = Division.order_by([:name, :asc])
    end
    
end
