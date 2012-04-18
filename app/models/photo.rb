class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  # Fields
  field :title
  field :description
  field :photo
  field :order_no, :type => Integer
  field :property_id

  attr_accessible :title, :description,
                  :photo, :photo_cache, :remove_photo, 
                  :order_no, :property_id

  # References
  belongs_to :property
end
