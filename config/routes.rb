Rails.application.routes.draw do
  resources :portfolios, only: [:index]

  resources :users do
    resources :portfolios, controller: 'users/portfolios'
  end


  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/about', to: 'pages#about'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  root 'pages#home'
end
