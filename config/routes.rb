Blackdogproperty::Application.routes.draw do
  
  devise_for :users
  
  resources :sales, :only => :index
  match 'sales/about' => 'sales#about'

  match 'location/about' => 'locations#about'
  
  resources :rentals, :only => :index
  match 'rentals/about' => 'rentals#about'

  resources :renovations, :only => :index
  match 'renovations/about' => 'renovations#about'
  
  resources :services, :only => :index  
  match 'services/about' => 'services#about'
  
  match 'company/about' => 'company#about'
  match 'company/team' => 'company#team'
  match 'company/testimonials' => 'company#testimonials'

  resources :supports, :only => [:new, :create]
  match '/contact' => "supports#new", :as => :contact
  
  match 'location/:id' => 'high_voltage/pages#show', :as => :location_static, :via => :get
  match 'services/:id' => 'high_voltage/pages#show', :as => :services_static, :via => :get
  match 'company/:id' => 'high_voltage/pages#show', :as => :company_static, :via => :get
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get

  root :to => 'welcome#index'
end
