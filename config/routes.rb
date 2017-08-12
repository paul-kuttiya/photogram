Rails.application.routes.draw do
  root to: 'ui#index'
  get '/ui(/:action)', controller: 'ui'
  
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new" 

  resources :users, path: "/", only: [:show]
  resources :users, only: [:create]
  get '/account', to: "users#edit"

end
