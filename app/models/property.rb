class Property
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :title
  key :title
  field :image
  field :image_width
  field :description
  field :order_no, :type => Integer
  field :featured, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :title, :image, :image_width, :published, :description, :order_no, :published, :remove_image
end
