Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :contracts
  resources :tasks

  get 'login', to: 'auth#login'
  post 'authenticate', to: 'auth#authenticate'
  post 'logout', to: 'auth#logout'

  get 'dashboard', to: 'dashboard#index'

  root 'dashboard#index'

  get "up" => "rails/health#show", as: :rails_health_check
end
