Rails.application.routes.draw do
  devise_for :users

  resources :posts

  resource :profile, only: [ :show ]
  resource :follow, only: [ :create, :destroy ]
  resource :profile do
    get :edit
    patch :update
  end

  resources :users, only: [ :index, :show ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
