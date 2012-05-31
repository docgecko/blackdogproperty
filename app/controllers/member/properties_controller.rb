class Member::PropertiesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :property_photo, :only => :edit
  layout :resolve_layout
  
  actions :all, :full_address
  respond_to :html
  
  def index
    @properties = Property.where(user_id: current_user.id)
  end
  
  def full_address 
    render :text => Geocoder.search("Rua Almeida e Sousa 33, 1350-008 Lisboa, Portugal").inspect.to_s
  end
  
  # def new
  #   @property = Property.new
  #   # pre-build address for nested form builder
  #   @property.build_address
  # end
  
  def create
    # this will also build the embedded address object 
    # with the nested address parameters
    @property = Property.new params[:property]
    @property.save ? redirect_to(edit_member_property_path(@property)) : render(:action => :new)
  end

  # def update
  #   @property = Property.find(params[:id])
  #   @property.update_attributes(params[:property]) ?
  #   redirect_to(member_property_path(@property)) : render(:action => :edit)
  # end
  
  
  private
  
    def property_photo
      # TBD
    end
  
    def resolve_layout
      case action_name
      when "index", "new", "create"
        "member"
      else
        "property"
      end
    end
end
