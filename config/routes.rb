Blackdogproperty::Application.routes.draw do
  
  namespace :admin do
    resources :properties do
      resources :photos
    end
    resources :members
    resources :testimonials
  end

  devise_for :users, :path => "/", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'confirmation' }
  
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
  
  match 'location/:id' => 'high_voltage/pages#show', :as => :location_static, :via => :get
  match 'services/:id' => 'high_voltage/pages#show', :as => :services_static, :via => :get
  match 'company/:id' => 'high_voltage/pages#show', :as => :company_static, :via => :get
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get

  root :to => 'welcome#index'
end
