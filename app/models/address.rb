class Address
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Geocoder::Model::Mongoid
  
  # Callbacks
  # Address to GPS Coordinates
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  # GPS Coordinates to Address
  reverse_geocoded_by :coordinates
  after_validation :reverse_geocode, :if => :coordinates_changed?
  # Others
  after_validation :create_address
  
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
  
  
  def address
    [street, apt, city, state, zipcode, country].join(", ")
  end
    
  def latitude
    coordinates[0]
  end

  def longitude
    coordinates[1]
  end
end
