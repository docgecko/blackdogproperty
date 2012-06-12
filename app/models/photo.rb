class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include ActsAsList::Mongoid 
  # include Rails.application.routes.url_helpers
  
  # Fields
  field :title
  field :description
  field :image
  field :image_processing
  field :position,            type: Integer
  field :featured,            type: Boolean,    default: false
  field :published,           type: Boolean,    default: true
  field :property_id

  # Setup accessible (or protected) attributes
  attr_accessible :title, :description, 
                  :image, :image_tmp, :image_cache, :remove_image, 
                  :position, :featured, :published, 
                  :property_id, :_destroy

  # References
  belongs_to :property
  acts_as_list :scope => :property
  
  # Validations
  validates :image, 
            :presence => { :message => "Please select a photo to upload" }
  # validates :order_no, 
  #           :presence => { :message => "Please provide an Order No. for the property" }
  
  # Carrierwave
  mount_uploader :image, PhotoUploader
  process_in_background :image  
  
end
