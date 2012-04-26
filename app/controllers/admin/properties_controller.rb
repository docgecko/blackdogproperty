module Admin
  class PropertiesController < BaseController
    before_filter :authenticate_user!
    before_filter :all_types, :only => [ :new, :edit, :show, :index ]
    before_filter :all_countries, :only => [ :new, :edit, :show, :index ]
    before_filter :map_property, :only => :show
    layout 'admin'

    actions :all
    respond_to :html
    
    def index
      collection = resource_class.all.page.asc(:order_no)
    end
    
    private
      def all_types
        @types = Type.all
      end
      
      def all_countries
        @countries = Country.all
      end
      
      def map_property
        @property = Property.find(params[:id])
        @json = '[{"lat":'
        @json += @property.latitude.to_s
        @json += ',"lng":'
        @json += @property.longitude.to_s
        @json += '}]'
      end
  end
end