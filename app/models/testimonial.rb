class Testimonial
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  field :location
  field :details
  field :order_no, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :location, :details, :order_no, :published
end
