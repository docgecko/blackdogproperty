class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Rails.application.routes.url_helpers

  # Fields
  field :title
  field :description
  field :image
  field :order_no, :type => Integer
  field :featured, :type => Boolean, :default => false
  field :published, :type => Boolean, :default => true
  field :property_id

  # Setup accessible (or protected) attributes
  attr_accessible :title, :description, 
                  :image, :image_cache, :remove_image, 
                  :order_no, :featured, :published, 
                  :property_id

  # References
  belongs_to :property
  
  # Validations
  validates :order_no, 
            :presence => { :message => "Please provide an Order No. for the property" }
  
  # Carrierwave
  mount_uploader :image, PhotoUploader
  
  # Increment Order No.
  def order_no_next(order_no)
    order_no +1
  end
  
end
