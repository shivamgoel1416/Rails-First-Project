Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#index'
  get 'profile', to: 'pages#show'
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
end
