class Member::PhotosController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :first_property_image, :only => :new
  
  layout 'property'
  
  belongs_to :property, :polymorphic => true
  
  actions :all
  respond_to :html
  
  def create
    create!(:notice => "You have successfully uploaded a property photo.") { new_member_property_photo_url(params[:property_id]) }
  end
  
  protected
  
    def collection
      @photos ||= end_of_association_chain.where(property_id: @property.id).asc(:position)
    end
    
    def first_property_image
      @featured_photo = Photo.where(property_id: params[:property_id]).first
    end
end
