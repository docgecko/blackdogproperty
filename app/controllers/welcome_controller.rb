class WelcomeController < InheritedResources::Base
  actions :index
  respond_to :html
  
  def index
    @property = Property.first(conditions: {featured: true, published: true })
    @photos = Photo.where(property_id: @property.id, published: true).order_by([:featured, :desc], [:order_no, :asc])
  end
end
