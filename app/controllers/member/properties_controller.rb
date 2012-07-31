class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource :class => false
  before_filter :find_property_photos, :only => :edit
  before_filter :find_amenities, :only => [ :edit, :preview ]
  before_filter :prepare_google_maps, :only => :edit
  before_filter :find_edit_section, :only => [ :edit, :update, :update ]
  layout :resolve_layout
  
  actions :all
  respond_to :html
  
  def index
    @properties = Property.where(user_id: current_user.id)
  end
  
  def edit
    @property = Property.find_by_slug(params[:id])
  end
      
  def create
    @property = Property.new(params[:property], user_id: current_user.id)
    if @property.save
      redirect_to edit_member_property_path(:id => @property.slug, :section => (@section.present? ? @section : 'details'))
    else
      render :action => :new
    end
  end
  
  def new
    @property = Property.new
  end
  
  def update
    @property = Property.find_by_slug(params[:id])
    if params[:property][:published].present?
      if @property.update_attributes(params[:property])
        logger.debug "params[.section]: #{params[:section]}"
        if params[:section].blank?
          redirect_to new_member_property_photo_path(:property_id => @property.slug)
        else
          redirect_to edit_member_property_path(:id => @property.slug, :section => @section)
        end
      end
    else
      if @property.update_attributes(params[:property])
        redirect_to edit_member_property_path(:id => @property.slug, :section => @section), :notice =>"Your property was successfully updated."
      else
        redirect_to edit_member_property_path(:id => @property.slug, :section => @section), :alert => "There was a problem saving your property, please try again."
      end
    end
  end
  
  def destroy
    @property = Property.find_by_slug(params[:id])
    @property.destroy
    redirect_to member_properties_path, :notice => "You successfully deleted your property listing."
  end
  
  def preview
    @property = Property.find_by_slug(params[:id])
    @photos = @property.photos.order_by([:position, :asc])
    @circles = @property.to_gmaps4rails do |property, circle|
      circle.json :lat => property.longitude, :lng => property.latitude, :radius => 600
    end
  end

  private
  
    def resolve_layout
      case action_name
      when "index", "new", "create"
        "dashboard"
      when "preview"
        'application'
      else
        "property"
      end
    end
    
    def find_property_photos
      @property = Property.find_by_slug(params[:id])
      @photos = Photo.where(property_id: @property.slug)
    end
    
    def find_edit_section
      @section = params[:section]
    end
    
    def find_amenities
      @amenities = Amenity.order_by([[:division_id, :asc], [:name, :asc]])
      @divisions = Division.order_by([:name, :asc])
    end
    
    def prepare_google_maps
      @property = Property.find_by_slug(params[:id])
      @json = @property.to_gmaps4rails do |property, marker|
        marker.json :lat => property.longitude, :lng => property.latitude
      end
      @circles = @property.to_gmaps4rails do |property, circle|
        circle.json :lat => property.longitude, :lng => property.latitude, :radius => 600
      end
    end
    
    
  protected
  
    def collection
      @properties ||= end_of_association_chain.where(user_id: current_user.id)
    end
end
