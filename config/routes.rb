Rails.application.routes.draw do
  get 'entries/public' => 'entries/public'
  # get 'entries/random' => 'entries#random'

  resources :entries
  resources :bg_pictures
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'users' => 'users#new'
  get 'sessions' => 'sessions#new'
  root 'sessions#new'
end
