Altbreaks::Application.routes.draw do
  root :to => "page#about" #home page

  match 'about' => 'page#about', :as => 'about'
  match 'team' => 'page#team', :as => 'team'
  match 'map' => 'map#index', :as => 'map'

  resources :pages do
  	resources :posts
	end

  devise_for :users, :path => '',
  :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up' }

  resources :users do
    collection do
      get 'dashboard'
    end
  end

  resources :trip_instances, only: [:show, :create] do
    resources :posts
    resources :testimonies
    member do
      get 'display'
      get 'undisplay'
      put 'add_partner'
      delete 'remove_partner'
    end
  end

  resources :trips do
    resources :testimonies
  end

  resources :pages do
    resources :posts
  end

  resources :posts do
    member do
      get 'pages_index'
    end
  end

  resources :testimonies
  resources :photos
  resources :cover_photos
  resources :internal_trips
  resources :trip_permissions
  resources :partners
  resources :admin_permissions
  resources :requests
  resources :responses

  match "/map" => "map#index"

  match 'dashboard' => 'dashboard#index'
  match 'approve_request/:id' => 'requests#approve', :as => 'approve_request'

  match 'delete_from_trip/:tripinstid/:id' => 'dashboard#delete_from_trip', :as =>'delete_from_trip'

  match 'delete_admin/:admin_id' => 'admin_permissions#delete_admin', :as => 'delete_admin'
end
