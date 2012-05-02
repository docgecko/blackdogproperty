class Support
  include Mongoid::Document
  include Mongoid::Timestamps

  # Setup accessor attributes
  attr_accessor :id, :name, :email, :company, :phone, :location, 
                :content, :source_id, :interest_ids
  
  # Validations
  validates :name, :presence => { :message => "Please provide Your Name." }
  validates :email, :format => { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :message => "Please provide a valid Email address." }
  validates :interest_ids, :presence => { :message => "Please select at least one Interest." }
  validates :content, :presence => { :message => "Please provide Other enquiry information)." }
  
  # References
  belongs_to :source
  has_and_belongs_to_many :interests, inverse_of: nil
  
end
