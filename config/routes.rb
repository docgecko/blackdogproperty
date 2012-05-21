Blackdogproperty::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins, :path => "/admin", :path_names => { :sign_in => 'signin', :sign_out => 'logout', :password => 'secret' }
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # namespace :admin do
  #   resources :properties do
  #     resources :photos
  #   end
  #   resources :members
  #   resources :testimonials
  # end

  devise_for :users, :path => "/member", :path_names => { :sign_in => 'signin', :sign_out => 'logout', :password => 'secret', :confirmation => 'confirmation' }
  
  resources :sales, :only => :index
  match 'sales/about' => 'sales#about'

  match 'finding/about' => 'locations#about', :as => :location_about, :via => :get
  match 'finding/in/:id' => 'locations#country', :as => :location_country, :via => :get
  
  resources :rentals, :only => [ :index ]
  match 'rentals/in/:country_id' => 'rentals#search', :as => :rentals_search, :via => :get
  match 'rentals/in/:country_id/:id' => 'rentals#show', :as => :rental, :via => :get

  resources :renovations, :only => :index
  match 'renovation/about' => 'renovations#about', :as => :renovations_about, :via => :get
  
  resources :services, :only => :index  
  match 'services/about' => 'services#about'
  
  match 'company/about' => 'company#about'
  match 'company/team' => 'company#team'
  match 'company/testimonials' => 'company#testimonials'

  resources :contact, :as => :supports, :controller => :supports, :only => [:new, :create]
  
  match 'location/:id' => 'high_voltage/pages#show', :as => :location_static, :via => :get, :format => false
  match 'services/:id' => 'pages#show', :as => :services_static, :via => :get, :format => false
  match 'company/:id' => 'pages#show', :as => :company_static, :via => :get, :format => false
  match '/:id' => 'pages#show', :as => :static, :via => :get, :format => false
  
  root :to => 'welcome#index'
end
