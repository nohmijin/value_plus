Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'valueplus#index'
  
  get 'valueplus/index'
  
  post 'valueplus/sort'
  
  post '/valueplus/field' 
  
  post '/valueplus/sido'
  
  post 'valueplus/create'

  get 'valueplus/new'
  
  get 'valueplus/show'
  
  get 'valueplus/show/:assembly_id' => 'valueplus#show'
  
  get 'valueplus/destroy/:assembly_id' =>'valueplus#destroy'

  get 'valueplus/edit/:assembly_id' => 'valueplus#edit'
  
  post 'valueplus/update'

  get 'valueplus/donate_view/:assembly_id' => 'valueplus#donate_view'

  post 'valueplus/donate'
  
  get 'valueplus/match'
  
  post 'valueplus/matchFilter'

  get 'valueplus/check'

  post 'valueplus/myCareer'
  
  get 'valueplus/myCareerEdit/:career_id' => 'valueplus#myCareerEdit'
 
  post 'valueplus/myCareerUpdate'
  
  get 'valueplus/myCareerDestroy/:career_id' =>'valueplus#myCareerDestroy'
  
  get 'valueplus/profileEdit/:user_id' =>'valueplus#profileEdit'
  
  post 'valueplus/profileUpdate'
  
  get 'valueplus/mypage/:user_id' => 'valueplus#mypage'

  get 'valueplus/list'
  
  get '/valueplus/afterSigningUp_view'
  
  post '/valueplus/afterSigningUp'
  
  post 'assembly/:assembly_id/like' => 'likes#like_toggle'
  
  post 'assembly/:assembly_id/scrap' => 'scraps#scrap_toggle'

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
