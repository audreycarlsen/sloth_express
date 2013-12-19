SlothExpress::Application.routes.draw do

  root 'products#index'
  
  resources :products do
    collection do
      get 'search'
    end
    resources :reviews
  end

  get "/orders/empty" => "orders#empty"
  resources :orders
  resources :categories
  resources :order_items
  resources :users
  resources :sessions
  resources :purchases
  resources :categories

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in"  => "sessions#new",     :as => "log_in"
  get "sign_up" => "users#new",        :as => "sign_up"
  get "vendors" => "users#vendors",    :as => "vendors"
  get "sloth_king" => "users#sloth_king"
  get "users/:id/order" => "users#order"

  delete '/order_items/:id/remove_item/:product_id' => "order_items#remove_item", as: :remove_item
  post '/products/:id/retire_product/:product_id' => "products#retire_product", as: :retire_product
  post '/products/:id/activate_product/:product_id' => "products#activate_product", as: :activate_product
  post '/users/:id/completed/' => "orders#completed", as: :completed
  post '/users/:id/cancelled/' => "orders#cancelled", as: :cancelled
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
