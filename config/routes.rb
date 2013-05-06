Altbreaks::Application.routes.draw do  
  root :to => "map#index" #home page

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

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
