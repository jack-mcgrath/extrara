Rails.application.routes.draw do

  # This line mounts Forem's routes at /talk by default.
  # This means, any requests to the /talk URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  resources :projects
  devise_for :users
  resources :conversations, only: [:index, :show, :new, :create] do
      member do
          post :reply
          post :trash
          post :untrash
          post :new
      end
  end
  get 'users/:id' => 'users#show', as: :user
  get 'projects/new' => 'projects#new' 
  get 'projects' => 'projects#index'
  get 'users/show'
  #match '/:user' => "users#show", :as => :user_profile <<still working on this.
  #get 'static/index' => 'static#index'


# The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'static#index'
  #authenticated :user do
      #    root :to => "welcome#index", :as => "authenticated_root"
      # Rails 4 users must specify the 'as' option to give it a unique name
      # root :to => "main#dashboard", :as => "authenticated_root"
  
  #root 'static#index'
  authenticated :user do
      root :to => "welcome#index"
  end
  
  unauthenticated :user do
      devise_scope :user do
          get "/" => "static#index"
      end
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
end
