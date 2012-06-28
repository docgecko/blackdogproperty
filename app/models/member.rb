class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  # Fields
  field :name
  field :avatar
  field :profile
  field :position, :type => Integer
  field :published, :type => Boolean, :default => false
  
  # Setup accessible (or protected) attributes
  attr_accessible :name, :avatar, :avatar_cache, :remove_avatar, 
                  :profile, :position, :published
  
  # Carrierwave
  mount_uploader :avatar, AvatarUploader
end
