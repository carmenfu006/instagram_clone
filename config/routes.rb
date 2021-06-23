Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/route', to: 'controller_name#action'
  root 'pages#homepage'
  # get '/', to: 'pages#homepage'
  get '/about', to: 'pages#about'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users do
    member do
      #/users/1/followings
      get :followings
      # users/1/followers
      get :followers
    end
  end

  resources :posts do
    # /post/1/comments
    # nested routes
    resources :comments
  end

  resources :relationships
end
