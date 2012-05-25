class Address
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps
  
  # Fields
  field :street
  field :apt
  field :city
  field :state
  field :zipcode
  field :country

  # Indexes
  spacial_index :coordinates
  
  # References
  embedded_in :property, :inverse_of => :address
  
  # Spacial
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => false
  
end
