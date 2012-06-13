class Member::PhotosController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :find_property, :only => [ :edit, :update ]
  
  layout :resolve_layout
  
  belongs_to :property, :polymorphic => true
  
  actions :all
  respond_to :html
  
  def edit
    resource = resource_class.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end
  
  def update
    resource = resource_class.find(params[:id])
    if resource.update_attributes(params[:photo])
      redirect_to new_member_property_photo_path(@property), :notice =>"Your photo was successfully updated."
    else
      redirect_to new_member_property_photo_path(@property), :alert => "There was a problem updating your photo, please try again."
    end
  end
  
  def create
    create!(:notice => "You have successfully uploaded a property photo.") { new_member_property_photo_url(params[:property_id]) }
  end
  
  def destroy
    resource = resource_class.find(params[:id])
    resource.destroy
    redirect_to new_member_property_photo_path(@property), :notice => "Your photo was successfully deleted."
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
      @property = Property.where(id: params[:property_id]).first
    end
  
  protected
  
    def collection
      @photos ||= end_of_association_chain.where(property_id: @property.id).asc(:position)
    end
end
