Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [ :show ]
  resource :follow, only: [ :create, :destroy ]

  resources :users, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
