class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'member'
  
  actions :all
  respond_to :html
    
  def index
    @properties = Property.where(user_id: current_user.id)
  end
  
  def new
    @property = Property.new
    # pre-build address for nested form builder
    @property.build_address
  end

  # def create
  #   # this will also build the embedded address object 
  #   # with the nested address parameters
  #   @property = Property.new params[:property]
  # 
  #   if @property.save
  #     # [..]
  #   end
  # end
end
