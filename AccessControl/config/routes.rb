Rails.application.routes.draw do

  root :to => 'sessions#new'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  
  resources :user, only: [:index,:new,:create,:show,:edit,:update]
  resources :sessions, only: [:new,:create,:destroy]

end
