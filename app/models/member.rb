class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  field :avatar
  field :profile
  field :order_no, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :avatar, :avatar_cache, :remove_avatar, 
                  :profile, :order_no, :published
  
  # Carrierwave
  mount_uploader :avatar, AvatarUploader
end
