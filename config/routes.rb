Rails.application.routes.draw do

  resources :users
  resources :favorite_gifs, only: [:index, :new, :create, :destroy, :show]
  resources :gifs, only: [:index]
  resources :categories
  namespace :admin do
    resources :gifs, only: [:index, :new, :create, :destroy]
    resources :categories, only: [:index, :new, :create, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
