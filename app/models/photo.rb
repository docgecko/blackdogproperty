class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  # include Rails.application.routes.url_helpers
  
  # Fields
  field :title
  field :description
  field :image
  field :image_processing
  field :order_no, :type => Integer
  field :featured, :type => Boolean, :default => false
  field :published, :type => Boolean, :default => true
  field :property_id

  # Setup accessible (or protected) attributes
  attr_accessible :title, :description, 
                  :image, :image_tmp, :image_cache, :remove_image, 
                  :order_no, :featured, :published, 
                  :property_id, :_destroy

  # References
  belongs_to :property
  
  # Validations
  # validates :order_no, 
  #           :presence => { :message => "Please provide an Order No. for the property" }
  
  # Carrierwave
  mount_uploader :image, PhotoUploader
  process_in_background :image  
  
  # def image=(val)
  #   if !val.is_a?(String) && valid?
  #     image_will_change!
  #     super
  #   end
  # end
  
  # Increment Order No.
  def order_no_next(order_no)
    order_no +1
  end
  
end
