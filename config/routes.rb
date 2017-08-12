Rails.application.routes.draw do
  root to: 'ui#index'
  get '/ui(/:action)', controller: 'ui'
  
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new" 
  
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, path: "/", only: [:show]
  resources :users, only: [:create, :update]
  get '/accounts/edit', to: "users#edit"
end
