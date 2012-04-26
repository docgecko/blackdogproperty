class Support
  include Mongoid::Document
  include Mongoid::Timestamps

  # Setup accessor attributes
  attr_accessor :id, :name, :email, :company, :phone, :location, :method, :content, :source_id, :interest_ids
  
  # References
  belongs_to :source
  has_and_belongs_to_many :interests, inverse_of: nil
end
