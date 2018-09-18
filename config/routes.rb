Rails.application.routes.draw do
  resources :entries
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  root 'sessions#new'
end
