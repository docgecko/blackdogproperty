class Currency
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  key :name
  field :description
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :description
end
