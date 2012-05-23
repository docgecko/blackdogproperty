class Division
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  key :name

  # Setup accessible (or protected) attributes
  attr_accessible :name
    
  # References
  has_many :amenities
end
