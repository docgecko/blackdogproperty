module Admin
  class PhotosController < BaseController
    before_filter :authenticate_user!
    after_filter :featured_photo_check, :only => [ :update, :create ]
    before_filter :next_order_no, :only => [ :new, :create ]
    
    layout 'admin'
    
    belongs_to :property

    actions :all
    respond_to :html
    
    private
      def featured_photo_check
        if params[:id].present?
          @current_photo = Photo.find(params[:id])
          if @current_photo.featured == true && @current_photo.published == true
            @photos = Photo.where(property_id: params[:property_id]).excludes(id: params[:id])
            @photos.each do |photo|
              photo.featured = false
              photo.save!
            end
          end
        else
          @current_photo = Photo.where(property_id: params[:property_id]).last
          if @current_photo.featured == true
            @photos = Photo.where(property_id: params[:property_id]).excludes(id: @current_photo.id)
            @photos.each do |photo|
              photo.featured = false
              photo.save!
            end
          end
        end
      end
      
      def next_order_no
        p = Photo.where(property_id: params[:property_id]).order_by(:order_no, :asc).excludes(order_no: 0).last
        if p.present?
          @order_no = p.order_no + 1
        else
          @order_no = 1
        end
      end
  end
end