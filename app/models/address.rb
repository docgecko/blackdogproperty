class Address
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Callbacks
  
  # Fields
  field :address
  field :street
  field :apt
  field :city
  field :state
  field :zipcode
  field :country
  field :coordinates,                 type: Array, spacial: { lat: :latitude, lng: :longitude, return_array: true }

  # Indexes
  spacial_index :coordinates
  
  # Setup accessible (or protected) attributes
  attr_accessible :address, :street, :apt, :city, :state, :zipcode, :country,
                  :coordinates, :latitude, :longitude
  
  # References
  embedded_in :property, :inverse_of => :address
  
  # Spacial
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => false
    
  def latitude
    coordinates[0]
  end

  def longitude
    coordinates[1]
  end
end
