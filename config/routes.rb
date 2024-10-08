Rails.application.routes.draw do
  get "wishlist/index"
  
  resources :products, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'start_processing', to: 'link_processor#start'
  post 'process_links', to: 'link_processor#process_links'

  # Defines the root path route ("/")
  # root "posts#index"
  get '/wishlist', to: 'wishlist#index'
   post '/wishlist/add/:product_id', to: 'wishlist#add_to_wishlist', as: 'add_to_wishlist'
   delete '/wishlist/remove/:id', to: 'wishlist#remove_from_wishlist', as: 'remove_from_wishlist'
  root to: 'products#index'
end
