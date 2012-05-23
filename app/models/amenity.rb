class Amenity
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  key :name
  field :description
  field :order_no
  field :division_id
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :description, :order_no, :division_id
  
  # References
  has_and_belongs_to_many :properties
  belongs_to :division
end
