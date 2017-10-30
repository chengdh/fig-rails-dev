Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations" }
  resources :maximo_msgs,only: [:index,:show]
  resources :cux_pas,only: [:index,:show] do
    get :show_with_n_id,:on => :member
  end
  resources :cux_fa_transfer_headers,only: [:index,:show]
  resources :cux_gl_je_headers,only: [:index,:show]
  resources :cux_pm_pre_projects,only: [:index,:show]
  resources :cux_demands,only: [:index,:show]
  resources :cux_ap_invoices,only: [:index,:show]
  resources :cux_trans,only: [:index,:show]
  resources :po_headers,only: [:index,:show]

  namespace :api do
    namespace :v1  do
      resources :tokens,:only => [:create, :destroy] do
        post :test_connect,:on => :collection
      end
      resource :dataset,:only => [] do
        post :search_read,:on => :member
        post :call_kw,:on => :member
      end
    end
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'register_infos#index'

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
