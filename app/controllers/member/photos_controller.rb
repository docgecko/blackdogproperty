class Member::PhotosController < InheritedResources::Base
  before_filter :authenticate_user!
  authorize_resource
  before_filter :find_property, :only => [ :new, :create, :edit, :update ]
  before_filter :find_edit_section, :only => :new
  layout :resolve_layout
  
  force_ssl
  
  belongs_to :property, :polymorphic => true
  
  actions :all
  respond_to :html
    
  def edit
    @property = Property.find_by_slug(params[:property_id])
    @photo = Photo.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to new_member_property_photo_path(@property), :notice =>"Your photo was successfully updated."
    else
      redirect_to new_member_property_photo_path(@property), :alert => "There was a problem updating your photo, please try again."
    end
  end
  
  def new
    @property = Property.find_by_slug(params[:property_id])
    @photos = Photo.where(property_id: @property.id).asc(:position)
    @photo = Photo.new
  end
  
  def create
    @property = Property.find_by_slug(params[:property_id])
    @photo = Photo.new(params[:photo], property_id: @property.id)
    if @photo.save
      redirect_to new_member_property_photo_path(:property_id => params[:property_id]), :notice => "You have successfully uploaded a property photo. Once processing is finished, a thumbnail version of the image will appear below."
    else
      render(:action => :new)
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    @property = Property.find_by_slug(params[:property_id])
    redirect_to new_member_property_photo_path(:property_id => @property.slug), :notice => "Your photo was successfully deleted."
  end
  
  def sort
    params[:photo].each_with_index do |id, index|
      photo = Photo.find(id)
      photo.update_attribute(:position, index) if photo
    end
    render nothing: true
  end
  
  private
  
    def resolve_layout
      case action_name
      when "edit"
        "photo"
      else
        "property"
      end
    end
    
    def find_property
      @property ||= Property.find_by_slug(params[:property_id])
    end
    
    def find_edit_section
      @section = params[:section]
    end
end
