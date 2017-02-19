Rails.application.routes.draw do

  resources :users
  resources :gifs, only: [:index]
  resources :favorite_gifs

  namespace :admin do
    resources :gifs
    resources :categories
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
