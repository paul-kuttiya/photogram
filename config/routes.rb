Rails.application.routes.draw do
  root to: 'ui#index'
  get '/ui(/:action)', controller: 'ui'
  
  get '/signup', to: "users#new"
  get '/login', to: "sessions#new"
  
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, path: "/", only: [:show] do
    resources :posts, path: "/p" do
      member do
        post :comment, to: "comments#create"
      end
    end
  end

  get '/accounts/edit', to: 'users#edit'
  post '/accounts/update', to: 'users#update'

  resources :users, only: [:create]
end
