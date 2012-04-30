class Support
  include Mongoid::Document
  include Mongoid::Timestamps

  # Setup accessor attributes
  attr_accessor :id, :name, :email, :company, :phone, :location, 
                :content, :source_id, :interest_ids
  
  # Validations
  validates_presence_of :name, :message => "Your name is required."
  validates_presence_of :email, :message => "Your email address is required."
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :message => "Your email address is invalid."
  validates_presence_of :interest_ids, :message => "You must select at least one interest."
  validates_presence_of :content, :message => "You must provide details of your enquiry (Other information)."
  
  # References
  belongs_to :source
  has_and_belongs_to_many :interests, inverse_of: nil
  
end
