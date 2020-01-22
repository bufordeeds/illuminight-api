Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users
      post 'users/login' => 'users#login'
      get 'users/login' => 'users#login'
      # resources :users, only: [:show]
      resources :games
      resources :sessions, only: [:create, :destroy]
      root to:'static#home'
    end
  end

end
