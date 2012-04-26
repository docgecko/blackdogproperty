class Support
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :id, :name, :email, :company, :phone, :location, :method, :content, :hear_ids

end
