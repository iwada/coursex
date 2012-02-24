Coursex::Application.routes.draw do



  get "branches/index"

  get "branches/edit"

  get "branches/show"

  get "branches/new"

  get "branches/destroy"

  get "courses/new"

  get "courses/index"

  get "courses/edit"

  get "courses/update"

  get "courses/destroy"

  get "courses/show"

  get "trainers/new"

  get "trainers/index"

  get "trainers/edit"

  get "trainers/update"

  get "trainers/destroy"

  get "trainers/show"

  get "employees/index"

  get "employees/edit"

  get "employees/update"

  get "employees/destroy"

  get "employees/show"

  get "employee/index"

  get "employee/edit"

  get "employee/update"

  get "employee/destroy"

  get "employee/show"



  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "help" =>"pages#help" , :as => "help"



  resources :employees
  resources :users
  resources :sessions
  resources :password_resets
  resources :pages
  resources :trainers
  resources :courses
  resources :branches



resources :users do
  member do
    get :activate
  end
end

  get "sessions/new"

  get "users/new"

  get "pages/home"

  get "pages/contact"


  match '/help' ,     :to => 'pages#help'
  match '/whoweare'  ,    :to=> 'pages#whoweare'
  match 'whatwedo' , :to=> 'pages#whatwedo'
  match '/contact',       :to=>'pages#contact'
  match '/ourcourses' ,      :to=>'pages#ourcourses'

  #match '/Who We Are', :to=>'pages#whoweare'


  root :to=> 'pages#home'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
