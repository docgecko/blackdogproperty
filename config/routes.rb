Blackdogproperty::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins,
             :path => "/admin", 
             :path_names => {  :sign_in => 'signin', 
                               :sign_out => 'signout', 
                               :password => 'password' }
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users,
             :path => "/member",
             :controllers => { :registrations => 'member/registrations',
                               :sessions => 'member/sessions',
                               :confirmations => 'member/confirmations',
                               :passwords => 'member/passwords' },
             :path_names => {  :sign_in => 'signin', 
                               :sign_up => 'registration', 
                               :sign_out => 'signout', 
                               :password => 'password', 
                               :confirmation => 'confirmation' }
    
  match '/account/check_email' => "member/accounts#check_email"
  match '/account/check_username' => "member/accounts#check_username"
  
  namespace :member do
    resources :dashboard, :only => [ :index ]
    resources :properties do
      resources :photos#, :except => [ :index ]
      member do
        get :overview
        get :preview
      end
    end
    resources :profiles, :only => [ :edit, :update ]
    resources :accounts, :only => [ :edit, :update ]
  end
  
  # match "/member/full_address" => "member/properties#full_address"

  match "/member" => redirect("/member/dashboard")
  
  resources :sales, :only => :index
  match 'sales/about' => 'sales#about'

  match 'finding/about' => 'locations#about', :as => :location_about, :via => :get
  match 'finding/in/:id' => 'locations#country', :as => :location_country, :via => :get
  
  resources :rentals, :only => [ :index ]
  match 'rentals/in/:country_id' => 'rentals#search', :as => :rentals_search, :via => :get
  match 'rentals/in/:country_id/:id' => 'rentals#show', :as => :rental, :via => :get

  resources :lastminutes, :only => [ :index ]
  match 'lastminutes/in/:country_id' => 'lastminutes#search', :as => :lastminutes_search, :via => :get
  match 'lastminutes/in/:country_id/:id' => 'lastminutes#show', :as => :lastminute, :via => :get

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
