#coding: utf-8
Rails.application.routes.draw do
  resources :salary_report_non_staffs
  resources :salary_report_retireds
  resources :salary_report_on_duty_employees
  resources :base_salary_reports
  resources :salary_report_leaders
  resources :salary_report_xians
  resources :salary_report_shis,only: [:index,:show]
  resources :purchase_order_virtuals do
    member do
      patch :confirm
      get :export_excel
    end
    collection do
      get :search
    end

  end
  resources :purchase_order_consumes do
    member do
      patch :confirm
      get :export_excel
    end
    collection do
      get :search
    end
  end
  resources :purchase_order_assets do
    member do
      patch :confirm
      get :export_excel
    end
    collection do
      get :search
    end
  end
  resources :purchase_order_its do
    member do
      patch :confirm
      get :export_excel
    end
    collection do
      get :search
    end
  end
  resources :receive_bill_virtuals do
    member do
      patch :confirm
    end
    collection do
      get :search
    end
  end
  resources :receipt_virtuals do
    member do
      patch :confirm
    end
    collection do
      get :search
    end

  end
  resources :stock_virtuals do
    collection do
      get :select
      get :search
    end

  end
  resources :receive_bill_consumes do
    member do
      patch :confirm
      get :export_excel
    end
    collection do
      get :search
    end
  end
  resources :receipt_consumes do
    member do
      patch :confirm
    end
    collection do
      get :search
    end
  end
  resources :stock_consumes do
    collection do
      get :select
      get :search
    end
  end
  resources :receive_bill_assets do
    member do
      patch :confirm
      get :export_excel
    end
    collection do
      get :search
    end

  end
  resources :worthless_bill_assets do
    member do
      patch :confirm
    end
    collection do
      get :search
    end
  end

  resources :repair_bill_assets do
    member do
      patch :confirm
    end
    collection do
      get :search
    end
  end
  resources :move_bill_assets do
    member do
      patch :confirm
    end
    collection do
      get :search
    end
  end
  resources :stock_assets do
    collection do
      get :select
      get :search
    end
  end
  resources :shippment_assets do
    member do
      patch :confirm
    end
    collection do
      get :search
    end
  end
  resources :receipt_assets do
    member do
      patch :confirm
    end
  end
  resources :stock_its do
    collection do
      get :select
      get :search
    end
  end

  resources :receive_bills do
    member do
      patch :confirm
      get :export_excel
    end
  end
  #resources :base_purchase_orders
  resources :equip_virtuals do
    collection do
      get :select
      get :search
    end
  end
  resources :equip_consumes do
    collection do
      get :select
      get :search
    end
  end
  resources :equip_its do
    collection do
      get :select
      get :search
    end
  end
  resources :equip_assets do
    collection do
      get :select
      get :search
    end
  end
  resources :check_assessments do
    member do
      get :show_check
    end
    collection do
      get :search
    end
  end

  resources :assessments do
    member do
      patch :submit
    end
    collection do
      get :search
    end

  end
  resources :punish_org_punishments do
    collection do
      get :search
    end
  end
  resources :punishments do
    member do
      patch :confirm
    end
    collection do
      get :search
    end
  end
  resources :check_rewards do
    member do
      get :show_check
    end
    collection do
      get :search
    end
  end

  resources :rewards do
    collection do
      get :search
    end
  end

  resources :stocks
  resources :worthless_bills do
    member do
      patch :confirm
    end
    collection do
      get :search
    end

  end
  resources :repair_bills do
    member do
      patch :confirm
    end
    collection do
      get :search
    end

  end
  resources :shippments do
    member do
      patch :confirm
    end
    collection do
      get :search
    end

  end
  resources :move_bills do
    member do
      patch :confirm
    end
    collection do
      get :search
    end

  end
  resources :salary_tables do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end

  resources :salary_table_xian_leaders do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end

  resources :salary_table_xian_on_duties do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end

  resources :salary_table_xian_retireds do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end


  resources :salary_table_xian_non_staffs do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end

  resources :salary_table_shi_leaders do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end

  resources :salary_table_shi_on_duties do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end

  resources :salary_table_shi_non_staffs do
    collection do
      get :search
      get :show_import_xls
      get :before_new
      post :import_xls
    end
  end
  #resources :salary_item_headers
  #resources :salary_items
  resources :own_tasks do
    member do
      get :show_line
      patch :save_line
      patch :finish
    end
    collection do
      get :search
    end
  end
  resources :tasks do
    member do
      patch :deliver
      patch :confirm
    end
    collection do
      get :search
    end

  end
  resources :task_categories
  resources :danger_org_hidden_dangers do
    member do
      get :show_fix
      patch :fix
      get :show_postponement
      patch :postponement
    end
    collection do
      get :search
    end


  end
  resources :hidden_dangers do
    member do
      patch :deliver
      patch :review
      get :show_review
      get :export_excel_single
    end
    collection do
      get :search
      get :export_excel
    end
  end
  resources :check_meetings do
    member do
      get :show_check
      patch :check
    end
    collection do
      get :search
    end

  end

  resources :meetings do
    collection do
      get :search
    end
    member do
      patch :submit
    end
  end
  resources :check_planb_docs do
    member do
      get :show_check
      patch :check
    end
    collection do
      get :search
    end

  end

  resources :planb_docs do
    collection do
      get :search
    end
    member do
      patch :submit
    end
  end
  resources :trainings do
    collection do
      get :search
    end
    member do
      patch :submit
    end

  end
  resources :check_trainings do
    member do
      get :show_check
      patch :check
    end
    collection do
      get :search
    end
  end
  resources :accident_headers do
    collection do
      get :search
    end
    member do
      patch :submit
    end
  end

  resources :check_accident_headers do
    member do
      get :show_check
      patch :check
    end
    collection do
      get :search
    end

  end


  resources :check_safety_tables do
    member do
      get :show_check
      patch :check
    end
    collection do
      get :search
    end

  end


  resources :safety_tables do
    collection do
      get :search
    end
    member do
      patch :submit

    end
  end
  resources :houses do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :protect_equipments do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :protect_equipment_categories
  resources :temporary_employees do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :distribute_boxes do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :transformers do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :low_pressure_rooms do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :high_pressure_rooms do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :electric_equipments do
    collection do
      get :search
    end
  end
  resources :spec_warehouses do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :spec_equipments do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :drivers do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :vehicles do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :fire_fighting_equipments do
    collection do
      get :search
      get :export_excel
    end
  end
  resources :inout_lines
  resources :receipts do
    member do
      patch :confirm
    end
  end
  resources :inout_bills
  resources :equipment do
    collection do
      get :select
      get :search
    end
  end
  resources :locations
  resources :warehouses
  resources :warehouse_types
  resources :units
  resources :equipment_categories

  devise_for :users

  resources :roles

  resources :orgs

  resources :users do
    member do
      put :update_default_attr
    end
    collection do
      get :edit_password
      put :update_password
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
  root 'dashboard#index'

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
