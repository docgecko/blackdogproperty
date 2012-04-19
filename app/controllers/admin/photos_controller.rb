module Admin
  class PhotosController < BaseController
    before_filter :authenticate_user!
    layout 'admin'
    
    belongs_to :property

    actions :all
    respond_to :html
  end
end