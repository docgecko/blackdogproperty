class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_property_photos, :only => :edit
  before_filter :featured_property_photo, :only => :edit
  before_filter :find_amenities, :only => :edit
  before_filter :prepare_google_maps, :only => :edit
  before_filter :find_edit_section, :only => [ :create, :update ]
  after_filter  :repair_photo_links, :only => :update
  layout :resolve_layout
  
  actions :all#, :full_address
  respond_to :html
      
  def create
    @section = 'details'
    resource = resource_class.new(params[:property], user_id: current_user.id)
    resource.save ? redirect_to(edit_member_property_path(:id => resource.id, :section => @section)) : render(:action => :new)
  end
  
  def update
    if (params[:property][:title].blank?) or (params[:property][:title] == params[:stored][:title])
      resource = Property.find(params[:id])
    else
      original = Property.find(params[:stored][:id])
      resource = original.clone
      resource.title = params[:property][:title]
      resource._id = resource.title.downcase.gsub(' ', '-')
      original.destroy
      @property_id_old = params[:stored][:id]
      logger.debug "Old id: #{@property_id_old}"
      @property_id_new = (params[:property][:title]).downcase.gsub(' ', '-')
      logger.debug "New id: #{@property_id_new}"
    end
    if params[:property][:published].present? and 
      if resource.update_attributes(params[:property])
        redirect_to edit_member_property_path(resource, :section => @section)
      else
        redirect_to edit_member_property_path(resource, :section => @section)
      end
    else
      if resource.update_attributes(params[:property])
        redirect_to edit_member_property_path(resource, :section => @section), :notice =>"Your property was successfully updated."
      else
        redirect_to edit_member_property_path(resource, :section => @section), :alert => "There was a problem saving your property, please try again."
      end
    end
  end
  
  def destroy
    resource = Property.find(params[:id])
    resource.destroy
    redirect_to member_properties_path, :notice => "You successfully deleted your property listing."
  end
  
  # Extra for testing only
  # def full_address 
  #   render :text => Geocoder.search("Rua Almeida e Sousa 33, 1350-008 Lisboa, Portugal").inspect.to_s
  # end
  
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
    
    def find_edit_section
      @section = params[:section]
    end
    
    def find_amenities
      @amenities = Amenity.order_by([[:division_id, :asc], [:name, :asc]])
      @divisions = Division.order_by([:name, :asc])
    end
    
    def prepare_google_maps
      resource = Property.find(params[:id])
      @json = resource.to_gmaps4rails do |property, marker|
        marker.json :lat => property.longitude, :lng => property.latitude
      end
      @circles = resource.to_gmaps4rails do |property, circle|
        circle.json :lat => property.longitude, :lng => property.latitude, :radius => 600
      end
    end
    
    def repair_photo_links
      logger.debug "Hello from here"
      @photos = Photo.where(property_id: @property_id_old)
      logger.debug "@property_id_old: #{@property_id_old}"
      logger.debug "@photos.count: #{@photos.count}"
      logger.debug "Hello from here again"
      @photos.each do |photo|
        photo.property_id = @property_id_new
        logger.debug "Photo id: #{photo.id}"
        logger.debug "New Photo property id: #{photo.property_id}"
        photo.save
      end
    end
    
    
  protected
  
    def collection
      @properties ||= end_of_association_chain.where(user_id: current_user.id)
    end
end
