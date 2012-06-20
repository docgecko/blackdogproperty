require 'carrierwave/mongoid'

Mongoid::Document::ClassMethods.send(:include, ::CarrierWave::Backgrounder::ORM::Base)

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS'
  }
  # config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

if Rails.env.development? or Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_directory  = 'bdp-assets-development'                     # required
  end
elsif Rails.env.staging?
  CarrierWave.configure do |config|
    config.fog_directory  = 'bdp-assets-staging'                     # required
  end
else
  CarrierWave.configure do |config|
    config.fog_directory  = 'bdp-assets'                     # required
  end
end  