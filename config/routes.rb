Rails.application.routes.draw do

  resources :entries 

#this makes the root of the whole app the entry's index page, showing all the entries
  root "entries#index"



end
