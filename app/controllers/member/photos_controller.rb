class Member::PhotosController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_property, :only => [ :new, :create, :edit, :update ]
  layout :resolve_layout
  
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
    @photos = Photo.where(property_id: @property.slug).asc(:position)
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to new_member_property_photo_path(:property_id => params[:property_id]), :notice => "You have successfully uploaded a property photo."
    else
      render(:action => :new)
    end
  end
  
  def destroy
    @property = Property.find_by_slug(params[:property_id])
    logger.debug "@property.slug: #{@property.slug}"
    @photo = Photo.find(params[:id])
    logger.debug "@photo.id: #{@photo.id}"
    @photo.destroy
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
    
  
  # protected
  # 
  #   def collection
  #     @photos ||= end_of_association_chain.where(property_id: @property.slug).asc(:position)
  #   end
end
