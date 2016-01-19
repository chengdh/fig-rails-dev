Rails.application.routes.draw do

  resources :odd_changes
  devise_for :users, controllers: {registrations: "registrations"}
  resources :league_rankings
  resources :events
  resources :odds_balls
  resources :odds_europes
  resources :odds_asians
  resources :current_matches
  resources :lineups
  resources :leagues do
    get :search,on: :collection
  end
  resources :companies
  resources :countries
  resources :teams
  resources :contients

  resources :matches do
    get :immediate,on: :collection
    get :last_week,on: :collection
    get :this_week,on: :collection
    get :sb_list,on: :collection
    get :immediate_index,on: :collection
    get :search_by_league,on: :collection
    get :show_recommand,on: :collection
    get :show_bigdata,on: :member
  end

  constraints(:id => /\w+(,\w+)*/) do
    resources :user_favorites
  end

  constraints(:id => /\w+(,\w+)(,\w+)*/) do
    resources :match_recommands
  end


  #当前用户关注
  get 'my_favorites/:user_id' => 'user_favorites#my_favorites'

  #用户关注比赛-事件
  get 'my_favorites/:user_id/events' => 'user_favorites#my_favorites_events'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'contients#index'

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
