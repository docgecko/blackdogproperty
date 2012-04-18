class Property
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :title
  key :title
  field :bio
  field :reference
  field :description
  field :facilities
  field :type, :type => Integer
  field :price
  field :price_details
  field :location
  field :longitude, :type => Float
  field :latitude, :type => Float
  field :gmaps, :type => Boolean
  field :order_no, :type => Integer
  field :featured, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :title, :bio, :decription, :facilities, :type, 
                  :price, :price_details, :reference,
                  :location, :longitude, :latitude, :gmaps,
                  :order_no, :featured, :published

  # References
  has_many :photos
end
