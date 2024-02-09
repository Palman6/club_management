# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'

  root to: 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }

  resources :users

  # event categories routes
  get 'events/my_event', to: 'events#my_event'
  get 'events/past', to: 'events#past'
  get 'events/upcoming', to: 'events#upcoming'
  get 'events/current', to: 'events#current'

  resources :events

  get 'my_profile', to: 'users#my_profile'
  get 'events', to: 'events#show'

  post 'create_attending', to: 'attendings#create'
  delete 'destroy_attending', to: 'attendings#destroy'

  resources :users, only: [:destroy]

  resources :news
end
