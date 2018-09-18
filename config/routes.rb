Rails.application.routes.draw do

  resources :entries
  resources :users, only: %i(new create show)
  resource :sessions, only: %i(new create destroy)

  root "entries#index"

  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout


end
