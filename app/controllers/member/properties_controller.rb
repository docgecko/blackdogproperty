class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'member'  
  
  actions :all
  respond_to :html
  
  # def index
  #   @properties = Property.where(user_id: current_user.id)
  # end
  # 
  # def new
  #   @property = Property.new
  #   # pre-build address for nested form builder
  #   @property.build_address
  # end
  # 
  # def create
  #   # this will also build the embedded address object 
  #   # with the nested address parameters
  #   @property = Property.new params[:property]
  #   @property.save ? redirect_to(member_property_path(@property)) : render(:action => :new)
  # end
  # 
  # def update
  #   @property = Property.find(params[:id])
  #   @property.update_attributes(params[:property]) ?
  #   redirect_to(member_property_path(@property)) : render(:action => :edit)
  # end
end
