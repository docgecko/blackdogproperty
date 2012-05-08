source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'thin'

gem 'inherited_resources', '1.3.0'
gem 'devise'
gem 'cancan'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'mongoid', '>= 2.0.0.beta.19'
gem 'bson_ext'
gem 'haml', '>= 3.0.0'
gem 'haml-rails'
gem 'redcarpet', '1.17.2'
gem 'dalli'
gem 'i18n', '0.6.0'
gem 'high_voltage', '1.0.1'
gem 'simple-navigation'
gem 'carrierwave', '0.5.7'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick', '3.3'
gem 'kaminari', '0.13.0'
gem 'rack-rewrite', '1.0.2'
gem 'gmaps4rails'
gem 'mongoid_spacial'
gem "fog", "~> 1.3.1"

group :development, :test do
	gem 'rspec-rails', '>= 2.6.1'
	gem 'capybara'
	gem 'autotest-rails', '4.1.1'
	gem 'autotest-growl', '0.2.11'
	gem 'guard-bundler'
	gem 'guard-rspec'
	gem 'guard-cucumber'
	gem 'guard-livereload'
	gem 'em-websocket'
	gem 'growl'
	gem 'relish', '0.5.1'
	gem 'colored'
end

group :test do
	gem 'cucumber-rails'
end

group :development do
	gem 'hpricot'
	gem 'ruby_parser'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
	# Pretty printed test output
	gem 'turn', :require => false
	gem 'cucumber-rails'
	gem 'database_cleaner', '>= 0.6.7'
	gem 'mongoid-rspec', '>= 1.4.4'
	gem 'factory_girl_rails', '>= 1.1.0'
	gem 'launchy', '>= 2.0.5'
end
