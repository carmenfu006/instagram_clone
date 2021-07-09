Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/route', to: 'controller_name#action'
  root 'pages#homepage'
  # get '/', to: 'pages#homepage'
  get '/about', to: 'pages#about'

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
