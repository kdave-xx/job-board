ActionController::Routing::Routes.draw do |map|
 
  map.resources :password_resets, :only => [ :new, :create, :edit, :update ]

  map.resources :jobs do |job|
    job.resources :applications
  end
  map.resource :user_session
 # map.root :controller => "user_sessions", :action => "new"
  map.resources :users
  map.myjobs '/myjobs', :controller => "jobs", :action => "myjobs"
  map.jobaward '/jobaward/:id', :controller => "jobs", :action => "jobaward"
  map.signup '/signup', :controller => "users", :action => "new"
  map.login '/login', :controller => "user_sessions", :action => "new"
  map.admin '/admin', :controller => "user_sessions", :action => "new"

  map.detail '/detail/:id', :controller => "jobs", :action => "detail"
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end
  map.namespace :admin do |admin|
     admin.resources :dashboard
     #admin.dashboard '/dashboard', :controller => "dashboard", :action => "index"
     admin.jobaward '/dashboard/jobaward/:id', :controller => "dashboard", :action => "jobaward"
  end
  # Sample resource route within a namespace:
     
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "jobs"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
