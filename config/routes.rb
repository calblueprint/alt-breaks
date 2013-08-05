Altbreaks::Application.routes.draw do
  root :to => "page#about" #home page

  #Pages
  match 'about' => 'page#about', :as => 'about'
  match 'team' => 'page#team', :as => 'team'
  match 'map' => 'map#index', :as => 'map'

  resources :pages do
  	resources :posts
	end

  resources :responses

  devise_for :users, :path => '',
  :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up' }

  resources :users do
    collection do
      get 'dashboard'
    end
  end

  resources :trip_instances do
    resources :posts
    resources :testimonies
  end

  resources :pages do
    resources :posts
  end

  resources :trips do
    resources :testimonies
  end

  resources :posts do
    member do
      get 'pages_index'
    end
  end

  resources :testimonies

  resources :internal_trips

  resources :trip_permissions

  resources :partners

  resources :admin_permissions

  match "/map" => "map#index"

  match 'dashboard' => 'dashboard#index'
  resources :requests
  match 'approve_request/:id' => 'requests#approve', :as => 'approve_request'

  match 'delete_from_trip/:tripinstid/:id' => 'dashboard#delete_from_trip', :as =>'delete_from_trip'

  match 'change_current/:trip_id/:new_current_inst_id' => 'dashboard#change_current', :as => 'change_current'

  match 'delete_admin/:admin_id' => 'admin_permissions#delete_admin', :as => 'delete_admin'

  match 'delete_break_leader/:permission_id' => 'dashboard#delete_break_leader', :as => 'delete_break_leader'
end
