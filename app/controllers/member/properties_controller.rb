class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_property_photos, :only => :edit
  before_filter :featured_property_photo, :only => :edit
  before_filter :find_amenities, :only => :edit
  before_filter :prepare_google_maps, :only => :edit
  before_filter :find_edit_section, :only => [ :create, :update ]
  before_filter :first_property_image, :only => :edit
  layout :resolve_layout
  
  actions :all#, :full_address
  respond_to :html
      
  def new
    resource = resource_class.new
    # resource.photos.build
  end
  
  def create
    resource = resource_class.new(params[:property], user_id: current_user.id)
    resource.save ? redirect_to(edit_member_property_path(:id => resource.id, :section => @section)) : render(:action => :new)
  end
  
  def show
    resource = resource_class.find(params[:id])
  end
  
  def edit
    resource = resource_class.find(params[:id])
    # resource.photos.build(:property_id => params[:id])
  end

  def update
    if (params[:property][:title].blank?) or (params[:property][:title] == params[:stored][:title])
      # logger.debug "Title: #{params[:title]}"
      # logger.debug "Propery title: #{params[:property][:title]}"
      # logger.debug "Stored propery title: #{params[:stored][:title]}"
      # logger.debug "Blank or same - id: #{params[:id]}"
      resource = Property.find(params[:id])
    else
      original = Property.find(params[:stored][:id])
      resource = original.clone
      resource.title = params[:property][:title]
      resource._id = resource.title.downcase.gsub(' ', '-')
      # logger.debug "Changed - id: #{resource.id}"
      original.destroy
    end
    if params[:property][:published].present?
      resource.update_attributes(params[:property]) ? redirect_to(edit_member_property_path(resource, :section => @section)) : redirect_to(edit_member_property_path(resource, :section => @section))
    else
      resource.update_attributes(params[:property]) ? redirect_to(edit_member_property_path(resource, :section => @section), :notice =>"Your property was successfully updated.") : redirect_to(edit_member_property_path(resource, :section => @section), :alert => "There was a problem saving your property, please try again.")
    end
  end
  
  def destroy
    resource = Property.find(params[:id])
    resource.destroy
    redirect_to edit_member_property_path(resource, :section => section), :notice => "Successfully destroyed photo."
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
    
    
  protected
  
    def collection
      @properties ||= end_of_association_chain.where(user_id: current_user.id)
    end
    
    def first_property_image
      @featured_photo = Photo.where(property_id: params[:id]).first
    end
end
