module A
  class MembersController < BaseController
    before_filter :authenticate_user!
    layout 'admin'

    actions :all
    respond_to :html
    
    def index
      collection = resource_class.all.page.asc(:order_no)
    end
  end
end