Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get "up" => "rails/health#show", as: :rails_health_check

  # match '/users',   to: 'users#index',   via: 'get'
  resources :users

  get '/users/edit', to: 'users/registrations#edit'
  # get '/users', to: 'users/registrations#destroy'

  get "my_profile", to: "users#my_profile"
  resources :users, only: [:destroy]

end
