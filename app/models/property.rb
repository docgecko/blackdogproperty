class Property
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Document
  include Mongoid::Spacial::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
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
  field :coordinates, type: Array, spacial: {lat: :latitude, lng: :longitude, return_array: true }
  field :order_no, :type => Integer
  field :featured, :type => Boolean, :default => false
  field :published, :type => Boolean, :default => false
  
  # Indexes
  spacial_index :coordinates
  
  # Setup accessible (or protected) attributes
  attr_accessible :title, :location, :country_id, :reference, :bio,
                  :description, :facilities, :type_ids, 
                  :price_sale, :price_rental,
                  :coordinates, :longitude, :latitude,
                  :order_no, :featured, :published

  # References
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos
  has_and_belongs_to_many :types, inverse_of: nil
  belongs_to :country
  
  # Validations
  validates_presence_of :coordinates
  validates_numericality_of :latitude, :less_than_or_equal_to => 180, :greater_than_or_equal_to => -180
  validates_numericality_of :longitude, :less_than_or_equal_to => 180, :greater_than_or_equal_to => -180

  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => false
  
  def latitude
    coordinates[0]
  end

  def longitude
    coordinates[1]
  end
end
