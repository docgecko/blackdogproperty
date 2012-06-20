class WelcomeController < InheritedResources::Base
  layout 'application'
  
  actions :index
  respond_to :html
  
  def index
    # The following is used if a gallery appears for a property e.g. Peter's old place
    # @property = Property.first(conditions: {featured: true, published: true })
    # if @property.present?
    #   @photos = Photo.where(property_id: @property.id, published: true).order_by([:featured, :desc], [:position, :asc])
    # end
  end
end
