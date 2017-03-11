Rails.application.routes.draw do
  resources :workouts do  
    resources :exercise
  end
  root 'workouts#index'
end
