Blackdogproperty::Application.routes.draw do
  
  devise_for :users
  
  resources :sales, :only => :index
  resources :locations, :only => :index
  resources :rentals, :only => :index
  resources :renovations, :only => :index
  resources :services, :only => :index
  
  resources :company, :only => [ :index ]
  match 'company/team' => 'company#team'
  match 'company/testimonials' => 'company#testimonials'

  resources :supports, :only => [:new, :create]
  match '/contact' => "supports#new", :as => :contact
  
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  match 'services/:id' => 'high_voltage/pages#show', :as => :services_static, :via => :get
  match 'company/:id' => 'high_voltage/pages#show', :as => :company_static, :via => :get

  root :to => 'welcome#index'
end
