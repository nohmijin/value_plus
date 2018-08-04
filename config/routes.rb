Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'valueplus#index'
  
  get 'valueplus/index'
  
  post 'valueplus/sort'
  
  post '/valueplus/field' 
  
  post '/valueplus/sido'
  
  post 'valueplus/create'

  get 'valueplus/new'
  
  get 'valueplus/show/:assembly_id' => 'valueplus#show'
  
  get 'valueplus/destroy'

  get 'valueplus/edit'
  
  post 'valueplus/update'

  get 'valueplus/donate'

  get 'valueplus/match'
  
  post 'valueplus/matchFilter'

  get 'valueplus/check'

  get 'valueplus/myCareer/:user_id' => 'valueplus#myCareer'

  get 'valueplus/myDonate/:user_id' => 'valueplus#myDonate'

  get 'valueplus/myScrap/:user_id' => 'valueplus#myScrap'

  get 'valueplus/myAssembly/:user_id' => 'valueplus#myAssembly'

  get 'valueplus/profileEdit/:user_id' =>'valueplus#profileEdit'
  
  post 'valueplus/profileUpdate'
  
  get 'valueplus/mypage/:user_id' => 'valueplus#mypage'

  get 'valueplus/list'
  
  get '/valueplus/afterSigningUp_view'
  
  post '/valueplus/afterSigningUp'

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
