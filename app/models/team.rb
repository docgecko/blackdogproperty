class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  key :name
  field :title
  field :image
  field :image_width
  field :description
  field :order_no, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :title, :image, :image_width, :published, :description, :order_no, :published, :remove_image
end
