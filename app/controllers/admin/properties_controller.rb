module Admin
  class PropertiesController < BaseController
    before_filter :authenticate_user!
    before_filter :all_types, :only => [ :new, :edit, :show, :index ]
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
  end
end