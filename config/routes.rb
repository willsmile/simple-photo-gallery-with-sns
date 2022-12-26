Rails.application.routes.draw do
  root to: 'photos#index'

  resources :photos, only: [:new, :create, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/oauth/authorize', to: 'oauth#authorize'
  get '/oauth/callback', to: 'oauth#callback'
end
