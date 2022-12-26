Rails.application.routes.draw do
  root to: 'photos#index'

  resources :photos

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
