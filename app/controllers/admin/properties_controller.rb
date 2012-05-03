module Admin
  class PropertiesController < BaseController
    before_filter :authenticate_user!
    before_filter :all_types, :only => [ :new, :edit, :show, :index ]
    before_filter :all_countries, :only => [ :new, :edit, :show, :index ]
    before_filter :map_property, :only => :show
    after_filter :featured_property_check, :only => [ :update, :create ]
    before_filter :next_order_no, :only => [ :new, :create ]
    
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
      
      def featured_property_check
        if params[:id].present?
          @current_property = Property.find(params[:id])
          if @current_property.featured == true
            @properties = Property.excludes(id: params[:id])
            @properties.each do |property|
              property.featured = false
              property.save!
            end
          end
        end
      end
      
      def next_order_no
        p = Property.order_by(:order_no, :asc).excludes(order_no: 0).last
        @order_no = p.order_no + 1
      end
  end
end