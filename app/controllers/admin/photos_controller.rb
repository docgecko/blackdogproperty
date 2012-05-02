module Admin
  class PhotosController < BaseController
    before_filter :authenticate_user!
    after_filter :featured_photo_check, :only => [ :update, :create ]
    
    layout 'admin'
    
    belongs_to :property

    actions :all
    respond_to :html
    
    private
      def featured_photo_check
        @current_photo = Photo.find(params[:id])
        if @current_photo.featured == true && @current_photo.published == true
          @photos = Photo.where(property_id: params[:property_id]).excludes(id: params[:id])
          @photos.each do |photo|
            photo.featured = false
            photo.save!
          end
        end
      end
  end
end