Rails.application.routes.draw do
  resources :protect_equipments
  resources :protect_equipment_categories
  resources :temporary_employees
  resources :distribute_boxes
  resources :transformers
  resources :low_pressure_rooms
  resources :high_pressure_rooms
  resources :electric_equipments
  resources :spec_warehouses
  resources :spec_equipments
  resources :drivers
  resources :vehicles
  resources :fire_fighting_equipments
  resources :inout_lines
  resources :receipts
  resources :inout_bills
  resources :equipment
  resources :locations
  resources :warehouses
  resources :warehouse_types
  resources :units
  resources :equipment_categories
  devise_for :users, controllers: {registrations: "registrations" }

  resources :roles

  resources :orgs

  resources :users do
    member do
      put :update_default_attr
    end
  end

  resources :employees do
    collection do
      get :search
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
