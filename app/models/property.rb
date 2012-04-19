class Property
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :title
  key :title
  field :location
  field :reference
  field :bio
  field :description
  field :facilities
  field :type_ids
  field :price_sale
  field :price_rental
  field :longitude, :type => Float
  field :latitude, :type => Float
  field :gmaps, :type => Boolean
  field :order_no, :type => Integer
  field :featured, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :title, :location, :reference, :bio,
                  :description, :facilities, :type_ids, 
                  :price_sale, :price_rental, :reference,
                  :longitude, :latitude, :gmaps,
                  :order_no, :featured, :published

  # References
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos
  has_and_belongs_to_many :types, inverse_of: nil
  
end
