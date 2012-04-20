class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  # Fields
  field :title
  field :description
  field :image
  field :order_no, :type => Integer
  field :featured, :type => Boolean, :default => false
  field :published, :type => Boolean, :default => false
  field :property_id

  attr_accessible :title, :description, 
                  :image, :image_cache, :remove_image, 
                  :order_no, :featured, :published, 
                  :property_id

  # References
  belongs_to :property
  
  # Carrierwave
  mount_uploader :image, PhotoUploader
end
