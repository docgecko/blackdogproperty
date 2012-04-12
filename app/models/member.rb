class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  field :image
  field :profile
  field :order_no, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :image, :profile, :remove_image, :order_no, :published
end
