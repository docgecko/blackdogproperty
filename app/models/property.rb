class Property
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid
  
  # Callbacks
  before_validation :create_address, 
                    :text_cleanse
  geocoded_by :address, :if => :coordinates_changed?
  reverse_geocoded_by :coordinates, :if => :address_changed?
  after_validation :geocode, :if => :address_changed?
  after_validation :reverse_geocode, :if => :coordinates_changed?
  before_save :create_address,
              :create_location_coordinates

  # Fields
  field :title
  key :title
  field :location
  # field :country_id
  field :reference
  field :bio
  field :description
  field :facilities
  field :purpose_ids
  field :type_id
  field :currency_sale
  field :currency_rental
  field :price_sale
  field :price_rental
  field :coordinates,                 type: Array,   spacial: {lat: :latitude, lng: :longitude, return_array: true }
  field :latitude,                    type: Float
  field :longitude,                   type: Float
  field :gmaps,                       type: Boolean
  field :zoom,                        type: Integer, default: 11
  field :order_no,                    type: Integer, default: 0
  field :featured,                    type: Boolean, default: false
  field :published,                   type: Boolean, default: false
  
  # Additional fields for Lastminute
  field :user_id
  field :phone_country
  field :phone_number
  field :amenity_ids               
  field :accommodates,                type: Integer
  field :bedrooms,                    type: Integer
  field :bathrooms,                   type: Integer
  field :living_room,                 type: Integer
  field :dining_room,                 type: Integer
  field :dining_outdoor,              type: Integer
  field :sun_loungers,                type: Integer
  field :balconies,                   type: Integer
  field :terraces,                    type: Integer
  field :sea_views,                   type: Boolean
  field :conventions,                 type: Boolean
  
  field :address
  field :street
  field :apt
  field :city
  field :state
  field :zipcode
  field :country
  
  # None-database fields
  attr_accessor :price, :currency
  
  # Indexes
  # spacial_index :coordinates
  
  # Pagination
  paginates_per 5
  
  # Setup accessible (or protected) attributes
  attr_accessible :title, :location, 
                  # :country_id, 
                  :reference, :bio,
                  :description, :facilities, :purpose_ids, :type_id, 
                  :price_sale, :price_rental, :price_rental, :currency_rental,
                  :coordinates, :latitude, :longitude, :zoom,
                  :order_no, :featured, :published,
                  :user_id, :phone_country, :phone_number,
                  :address_attributes,
                  :amenity_ids, :quantities,
                  :accommodates, :bedrooms, :bathrooms,
                  :living_room, :dining_room, :dining_outdoor,
                  :sun_loungers, :balconies, :terraces,
                  :sea_views, :conventions,
                  :address, :street, :apt, :city, :state, :zipcode, :country,
                  :photos_attributes

  # References
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true, :reject_if => lambda { |a| a[:image].blank? }
  belongs_to :type
  # belongs_to :country
  has_and_belongs_to_many :amenities, inverse_of: nil
  belongs_to :user
  
  # Validations
  validates_presence_of :title
  validates_uniqueness_of :title

  # Gmaps4Rails
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => false
  
  def latitude
    coordinates[0]
  end
  
  def longitude
    coordinates[1]
  end

  def address
    [self.street.strip, self.apt.strip, self.city.strip, self.state.strip, self.zipcode.strip, self.country].join(', ').gsub(', , ', ', ')
    # [self.street, self.city, self.state, self.country].compact.join(', ')
  end

  def create_location_coordinates
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end
  
  def create_address
    # self.address = [self.street, self.apt, self.city, self.state, self.zipcode, self.country].compact.join(', ')
    self.address = address
  end
  
  def text_cleanse
    self.description = Sanitize.clean(description)
    self.title = Sanitize.clean(title)
  end

end
