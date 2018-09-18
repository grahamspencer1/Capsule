Rails.application.routes.draw do

  resources :entries

#this makes the root of the whole app the entry's index page, showing all the entries
  root "entries#index"

  get 'login' => 'user_sessions#new', :as => :login
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resources :users, only: [:new, :create, :show]
  resources :user_sessions, only: [:create]

end
