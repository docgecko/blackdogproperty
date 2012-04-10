Blackdogproperty::Application.routes.draw do
  
  devise_for :users
  
  resources :sales, :only => :index
  resources :rentals, :only => :index
  resources :renovations, :only => :index
  resources :services, :only => :index
  resources :company, :only => :index

  resources :supports, :only => [:new, :create]
  match '/contact' => "supports#new", :as => :contact

  root :to => 'welcome#index'
end
