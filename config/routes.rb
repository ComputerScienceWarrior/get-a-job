Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :portfolios, only: [:index]
  end
  resources :portfolios, only: [:index]
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/about', to: 'pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'

  root 'pages#home'
end
