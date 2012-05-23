class Property
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  QUANTITIES = ['bedrooms','bathrooms','living_room','dining_indoor',
               'dining_outdoor','sun_lounger','balcony','terrace']
  
  # Fields
  field :title
  key :title
  field :location
  field :country_id
  field :reference
  field :bio
  field :description
  field :facilities
  field :type_ids
  field :price_sale
  field :price_rental
  field :coordinates,                 type: Array, spacial: {lat: :latitude, lng: :longitude, return_array: true }
  field :zoom,                        type: Integer
  field :order_no,                    type: Integer
  field :featured,                    type: Boolean, default: false
  field :published,                   type: Boolean, default: true
  
  # Additional fields for Lastminute
  field :user_id
  field :amenitiy_ids               
  field :quantities,                  type: Array, default: []
  # field :qty_accomodates,           type: Integer
  # field :qty_bedrooms,              type: Float
  # field :qty_bathrooms,             type: Float
  # field :qty_seat_living_room,      type: Integer
  # field :qty_seat_dining_room,      type: Integer
  # field :qty_seat_dining_outdoor,   type: Integer
  # field :qty_sun_lounger,           type: Integer
  
  # Indexes
  spacial_index :coordinates
  
  paginates_per 5
  
  # Setup accessible (or protected) attributes
  attr_accessible :title, :location, :country_id, :reference, :bio,
                  :description, :facilities, :type_ids, 
                  :price_sale, :price_rental,
                  :coordinates, :longitude, :latitude, :zoom,
                  :order_no, :featured, :published,
                  :user_id, :amentity_ids, :quantities

  # References
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos
  has_and_belongs_to_many :types, inverse_of: nil
  belongs_to :country
  has_and_belongs_to_many :amenities, inverse_of: nil
  
  # Validations
  validates :title, 
            :presence => { :message => "Please provide a Title for the property" }, 
            :uniqueness => { :message => "Please provide a unique Title of the property" }
  validates :country_id, 
            :presence => { :message => "Please select the Country location" }
  validates :coordinates, 
            :presence => { :message => "Please provide GPS Coordinates of the property" }
  validates :latitude,
            :numericality => { 
              :less_than_or_equal_to => 180, 
              :greater_than_or_equal_to => -180, 
              :message => "Please provide a valid Latitude of the GPS Coordinates" 
            }
  validates :longitude, 
            :numericality => { 
              :less_than_or_equal_to => 180, 
              :greater_than_or_equal_to => -180, 
              :message => "Please provide a valid Longitude of the GPS Coordinates" 
            }
  validates :zoom,
            :presence => {
              :message => "Please provide a Zoom value for the GPS Coordinates"
            },
            :numericality => { 
              :less_than_or_equal_to => 17, 
              :greater_than_or_equal_to => 0,
              :only_integer => true,
              :message => "The Zoom value must be an Integer between 0 and 17"
            }
  validates :order_no, 
            :presence => { :message => "Please provide an Order No. for the property" }

  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => false
  
  def latitude
    coordinates[0]
  end

  def longitude
    coordinates[1]
  end
end
