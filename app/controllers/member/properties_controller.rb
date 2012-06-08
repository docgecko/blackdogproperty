class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_property_photos, :only => :edit
  before_filter :featured_property_photo, :only => :edit
  before_filter :find_amenities, :only => :edit
  before_filter :prepare_google_maps, :only => :edit
  before_filter :build_one_photo, :only => [ :edit ]
  layout :resolve_layout
  
  actions :all, :full_address
  respond_to :html
  
  def index
    @properties = Property.where(user_id: current_user.id)
  end
    
  # def new
  #   @property = Property.new
  #   # pre-build address for nested form builder
  #   @property.build_address
  # end
  
  def create
    # this will also build the embedded address object 
    # with the nested address parameters
    @property = Property.new(params[:property], :user_id => current_user.id)
    @property.save ? redirect_to(edit_member_property_path(:id => @property.id, :section => 'details')) : render(:action => :new)
  end
  
  # def show
  # end
  
  # def edit
  # end

  def update
    section = params[:section]
    if (params[:property][:title].blank?) or (params[:property][:title] == params[:stored][:title])
      # logger.debug "Title: #{params[:title]}"
      # logger.debug "Propery title: #{params[:property][:title]}"
      # logger.debug "Stored propery title: #{params[:stored][:title]}"
      # logger.debug "Blank or same - id: #{params[:id]}"
      @property = Property.find(params[:id])
    else
      original = Property.find(params[:stored][:id])
      @property = original.clone
      @property.title = params[:property][:title]
      @property._id = @property.title.downcase.gsub(' ', '-')
      # logger.debug "Changed - id: #{@property.id}"
      original.destroy
    end
    if params[:property][:published].present?
      @property.update_attributes(params[:property]) ? redirect_to(edit_member_property_path(@property, :section => section)) : redirect_to(edit_member_property_path(@property, :section => section))
    else
      @property.update_attributes(params[:property]) ? redirect_to(edit_member_property_path(@property, :section => section), :notice =>"Your property was successfully updated.") : redirect_to(edit_member_property_path(@property, :section => section), :alert => "There was a problem saving your property, please try again.")
    end
  end
  
  # def destroy
  # end
  
  # Extra for testing only
  def full_address 
    render :text => Geocoder.search("Rua Almeida e Sousa 33, 1350-008 Lisboa, Portugal").inspect.to_s
  end
  
  
  private
  
    def resolve_layout
      case action_name
      when "index", "new", "create"
        "dashboard"
      else
        "property"
      end
    end
    
    def find_property_photos
      @photos = Photo.where(:property_id => resource.id)
    end
    
    def featured_property_photo
      # TBD
    end
    
    def build_one_photo
      @property.photos.build(:property_id => params[:id])
    end

    def find_amenities
      @amenities = Amenity.order_by([[:division_id, :asc], [:name, :asc]])
      @divisions = Division.order_by([:name, :asc])
    end
    
    def prepare_google_maps
      @property = Property.find(params[:id])
      @json = @property.to_gmaps4rails do |property, marker|
        marker.json :lat => property.longitude, :lng => property.latitude
      end
      @circles = @property.to_gmaps4rails do |property, circle|
        circle.json :lat => property.longitude, :lng => property.latitude, :radius => 600
      end
    end
    
end
