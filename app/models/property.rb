class Property
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Geocoder::Model::Mongoid
  
  # Callbacks
  before_validation :create_address, 
                    :text_cleanse
  geocoded_by :address, :if => :coordinates_changed?
  reverse_geocoded_by :coordinates, :if => :address_changed?
  after_validation :geocode, :if => :address_changed?
  after_validation :reverse_geocode, :if => :coordinates_changed?
  before_save :create_address,
              :create_latitude,
              :create_longitude,
              :create_currency_rental, 
              :create_price_rental

  # Fields
  field :title
  key :title
  field :location
  field :country_id
  field :reference
  field :bio
  field :description
  field :facilities
  field :purpose_ids
  field :type_ids
  field :currency_sale
  field :currency_rental
  field :price_sale
  field :price_rental
  field :coordinates,                 type: Array,   spacial: { lat: :latitude, lng: :longitude, return_array: true }
  field :zoom,                        type: Integer, default: 11
  field :order_no,                    type: Integer, default: 0
  field :featured,                    type: Boolean, default: false
  field :published,                   type: Boolean, default: false
  
  # Additional fields for Lastminute
  field :user_id
  field :phone_country
  field :phone_number
  field :amenitiy_ids               
  field :accomodates,                 type: Integer
  field :bedrooms,                    type: Integer
  field :bedrooms,                    type: Integer
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
  spacial_index :coordinates
  
  paginates_per 5
  
  # Setup accessible (or protected) attributes
  attr_accessible :title, :location, :country_id, :reference, :bio,
                  :description, :facilities, :purpose_ids, :type_ids, 
                  :price_sale, :price_rental, :price, :currency,
                  :coordinates, :longitude, :latitude, :zoom,
                  :order_no, :featured, :published,
                  :user_id, :phone_country, :phone_number,
                  :address_attributes,
                  :amentity_ids, :quantities,
                  :accomodates, :bedrooms, :bedrooms,
                  :living_room, :dining_room, :dining_outdoor,
                  :sun_loungers, :balconies, :terraces,
                  :sea_views, :conventions,
                  :address, :street, :apt, :city, :state, :zipcode, :country

  # References
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos
  has_and_belongs_to_many :types, inverse_of: nil
  belongs_to :country
  has_and_belongs_to_many :amenities, inverse_of: nil
  
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
  
  def currency_rental
    currency
  end
  
  def price_rental
    price
  end
  
  def address
    [self.street, self.apt, self.city, self.state, self.zipcode, self.country].compact.join(', ')
    # [self.street, self.city, self.state, self.country].compact.join(', ')
  end

  def create_currency_rental
   self.currency_rental = currency
  end
  
  def create_price_rental
    self.price_rental = price
  end
  
  def create_latitude
    self.latitude = coordinates[0]
  end

  def create_longitude
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
