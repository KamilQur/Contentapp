Rails.application.routes.draw do

 root 'home#home' 

 #get '/contents', to: 'contents#index'

 #get '/contents/new', to: 'contents#new', as: 'new_content'

 #post 'contents', to: 'contents#create'

 #get '/contents/:id/edit', to: 'contents#edit' as:'edit_content'

 #patch '/contents/:id', to: 'contents#update' 

 #get 'recipes/:id', to: 'contents#show' as: 'content' 

 #delete '/recipes/:id', to: 'contents#destroy'

 resources :contents 

 resources :contents do 
  resources :comments, only: [:create]  
 end

  resources :readers, only: [:update]
  resources :relationships, only: [:create, :destroy]


  resources :users, except: [:new] do
    member do
      get "send_message" 
    end
    collection do
      get "register_author"   
      post "register"
      get "register_reader"
    end
  end

  resources :users do 
    member do 
      get :following, :followers
  end
end 
 
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"

  get '/logout', to: "logins#destroy"

  resources :categories, only: [:show]  

  resources :readers,  only:[:update]   
   
  resources :messages, only: [:create, :new, :index] 
 
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
